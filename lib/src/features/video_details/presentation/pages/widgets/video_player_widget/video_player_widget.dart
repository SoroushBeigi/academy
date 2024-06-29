import 'package:academy/src/core/resources/app_constants.dart';
import 'package:academy/src/features/video_details/presentation/bloc/video_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import '../../../../../core/ui_kits/ac_loading/ac_loading.dart';
import '../../../../../saved/domain/entity/content/response/content_response_entity.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({required this.entity, super.key});

  final ContentResponseEntity entity;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {

  late VideoPlayerController _videoPlayerController1;
  ChewieController? _chewieController;
  int? bufferDelay;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController?.dispose();
    super.dispose();
  }



  Future<void> initializePlayer() async {
    final url = widget.entity.isLive == true
        ? VideoDetailsCubit.url
        : '${AppConstants.baseUrlWithoutPort}/${widget.entity.url}';
    _videoPlayerController1 = VideoPlayerController.networkUrl(
        Uri.parse(url));
    await _videoPlayerController1.initialize().then((_){
      setState(() {});
    });
    _chewieController = ChewieController(
      isLive: widget.entity.isLive == true,
      videoPlayerController: _videoPlayerController1,
      autoPlay: true,
      looping: true,
      progressIndicatorDelay:
      bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null, );

  }

  @override
  Widget build(BuildContext context) {
      // subtitleBuilder: (context, dynamic subtitle) =>
      //     Container(
      //       padding: const EdgeInsets.all(AppPadding.p12),
      //       decoration:
      //       BoxDecoration(borderRadius: BorderRadius.circular(AppSize.s12)),
      //       child: subtitle is InlineSpan
      //           ? RichText(
      //         text: subtitle,
      //       )
      //           : Text(
      //         subtitle.toString(),
      //         style: const TextStyle(color: Colors.black),
      //       ),
      //     ),

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
