import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/features/video_details/presentation/bloc/video_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:academy/src/features//features.dart';


class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key});
  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  final videoPlayerController = VideoPlayerController.networkUrl(Uri.parse('http://172.16.251.80/${VideoDetailsCubit.url}'));
  late VideoPlayerController _videoPlayerController1;
  late VideoPlayerController _videoPlayerController2;
  ChewieController? _chewieController;
  int? bufferDelay;

  @override
  void initState() {
    print('URL==');
    print(VideoDetailsCubit.url);
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  List<String> srcs = [
    'http://172.16.251.80/${VideoDetailsCubit.url}',
    'http://172.16.251.80/${VideoDetailsCubit.url}',
    'http://172.16.251.80/${VideoDetailsCubit.url}'
  ];

  Future<void> initializePlayer() async {
    _videoPlayerController1 =
        VideoPlayerController.networkUrl(Uri.parse('http://172.16.251.80/${VideoDetailsCubit.url}'));
    _videoPlayerController2 =
        VideoPlayerController.networkUrl(Uri.parse('http://172.16.251.80/${VideoDetailsCubit.url}'));
    await Future.wait([
      _videoPlayerController1.initialize(),
      _videoPlayerController2.initialize()
    ]);
    setState(() {});
  }

  int currPlayIndex = 0;

  Future<void> toggleVideo() async {
    await _videoPlayerController1.pause();
    currPlayIndex += 1;
    if (currPlayIndex >= srcs.length) {
      currPlayIndex = 0;
    }
    await initializePlayer();
  }


  @override
  Widget build(BuildContext context) {
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController1,
        autoPlay: true,
        looping: true,
        progressIndicatorDelay:
        bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,

        additionalOptions: (context) {
          return <OptionItem>[
            OptionItem(
              onTap: toggleVideo,
              iconData: Icons.live_tv_sharp,
              title: 'Toggle Video Src',
            ),
          ];
        },
        subtitleBuilder: (context, dynamic subtitle) => Container(
          padding: const EdgeInsets.all(AppPadding.p12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s12)
          ),
          child: subtitle is InlineSpan
              ? RichText(
            text: subtitle,
          )
              : Text(
            subtitle.toString(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
    );
    return Column(
      children: <Widget>[
        Expanded(
          child: Center(
            child: _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
                ? Chewie(
              controller: _chewieController!,
            )
                : const ACLoading(),
          ),
        ),
      ],
    );
  }
}

