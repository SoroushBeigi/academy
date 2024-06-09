import 'dart:async';
import 'dart:io';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/features/add/presentation/cubit/add_cubit.dart';
import 'package:academy/src/features/add/presentation/pages/widgets/upload_video/upload_video.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/core.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({super.key, required this.cameras});
  final List<CameraDescription> cameras;
  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  CameraController? controller;
  List<CameraDescription>? cameras;
  late Future<void> _initializeControllerFuture;
  bool isRecording = false;
  bool isPaused = false;
  Timer? _timer;
  int _start = 0;
  int selectedCameraIndex = 0;

  @override
  void initState() {
    super.initState();
    requestPermissions().then((_) => initCamera());
  }

  Future<void> requestPermissions() async {
    await [
      Permission.camera,
      Permission.microphone,
      Permission.storage,
    ].request();
  }

  Future<void> initCamera([int cameraIndex = 0]) async {
    cameras = await availableCameras();
    controller = CameraController(
      cameras![0],
      ResolutionPreset.high,
    );
    _initializeControllerFuture = controller!.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    controller?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  Future<XFile?> _recordVideo() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, '${DateTime.now()}.mp4');

    if(isRecording) {
      if(isPaused) {
        await controller?.resumeVideoRecording();
      }else {
        await controller?.pauseVideoRecording();
      }
      setState(() {
        isPaused = !isPaused;
      });
    } else {
      await controller?.startVideoRecording();
      startTimer();
      setState(() {
        isRecording = true;
        isPaused = false;
      });
    }
    return null;
  }

  void startTimer() {
    _start = 0;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (!isRecording) {
        timer.cancel();
      } else {
        setState(() {
          _start++;
        });
      }
    });
  }

  Future<XFile?> stopRecording() async {
    final file = await controller?.stopVideoRecording();
    _timer?.cancel();
    setState(() {
      isRecording = false;
    });
    return file;
  }

  String formatDuration(int seconds) {
    final duration = Duration(seconds: seconds);
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final secs = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$secs';
  }

  void toggleCamera() async {
    if (cameras == null || cameras!.isEmpty) {
      return;
    }
    selectedCameraIndex = (selectedCameraIndex + 1) % cameras!.length;
    await controller?.dispose();
    initCamera(selectedCameraIndex);
  }

  final picker = ImagePicker();

  Future<void> _pickVideo(BuildContext context) async {
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VideoPlayerScreen(videoPath: pickedFile.path),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null) {
      return const ACLoading();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Container(
          padding: const EdgeInsets.all(AppPadding.p8),
          decoration: BoxDecoration(
            color: isRecording ? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
          child: Text(
            formatDuration(_start),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: isRecording ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.onSurface),
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Positioned.fill(
                      child: CameraPreview(controller!));
                } else {
                  return const ACLoading();
                }
              }),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.15),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isRecording ? const SizedBox.shrink( ) : IconButton(
                      icon: const Icon(
                        Icons.photo_library,
                        color: Colors.white,
                        size: AppSize.s28,
                      ),
                      onPressed: () => _pickVideo(context),
                    ),
                    InkWell(
                      child: AnimatedContainer(
                        duration: AppTimes().t900,
                        child:
                        Container(
                          width: AppSize.s80,
                          height: AppSize.s80,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: AppSize.s4,
                                  color: Colors.white
                              )
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(isRecording ? AppPadding.p16 : AppPadding.p2),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: isRecording ? BoxShape.rectangle : BoxShape.circle,
                              ),

                            ),
                          ),
                        )
                      ),
                      onTap: () async {
                        try {
                          await _initializeControllerFuture;
                          if (isRecording) {
                            final file = await stopRecording();
                            if (file != null) {
                              print('Video recorded to ${file.path}');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VideoPlayerScreen(videoPath: file.path),
                                ),
                              );
                            }
                          }else {
                            await _recordVideo();
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                    ),
                    // isRecording ? const SizedBox.shrink( ) : IconButton(
                    //   icon: const Icon(
                    //     Icons.refresh,
                    //     color: Colors.white,
                    //     size: AppSize.s28,
                    //   ),
                    //   onPressed: toggleCamera,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;

  const VideoPlayerScreen({super.key, required this.videoPath});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videoPath))
      ..initialize().then((_) {
        setState(() {}); // Ensure the first frame is shown
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context).playVideo),
          centerTitle: true,
        actions: [
          ElevatedButton(
              onPressed: () {
                AddCubit.videoPath = widget.videoPath;
                context.pushNamed(UploadVideo.uploadVideoPageName);
              },
              child:  Text(
                  AppLocalizations.of(context).next
              ),
          )
        ],
      ),
      body: Stack(
        children: [
          _controller.value.isInitialized ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : const ACLoading(),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                setState(() {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                });
              },
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                size: AppSize.s42,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
