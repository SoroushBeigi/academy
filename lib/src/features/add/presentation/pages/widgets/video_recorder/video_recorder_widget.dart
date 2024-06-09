import 'package:academy/src/features/core/core.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class VideoRecorderWidget extends StatefulWidget {
  const VideoRecorderWidget({super.key});

  @override
  State<VideoRecorderWidget> createState() => _VideoRecorderWidgetState();
}

class _VideoRecorderWidgetState extends State<VideoRecorderWidget> {

  CameraController? controller;
  List<CameraDescription>? cameras;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
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
    super.dispose();
  }

  Future<XFile?> recordVideo() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, '${DateTime.now()}.mp4');

    await controller?.startVideoRecording();
    await Future.delayed(const Duration(seconds: 5)); // Record for 5 seconds
    final file = await controller?.stopVideoRecording();
    return file;
  }


  @override
  Widget build(BuildContext context) {
    if (controller == null) {
      return const ACLoading();
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Record Video')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(controller!);
          } else {
            return const ACLoading();
          }
        }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            final file = await recordVideo();
            if (file != null) {
              print('Video recorded to ${file.path}');
            }
          } catch (e) {
            print(e);
          }
        },
        child: Icon(Icons.videocam),
      ),
    );
  }
}
