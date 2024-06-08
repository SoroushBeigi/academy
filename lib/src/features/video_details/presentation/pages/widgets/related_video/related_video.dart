import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:academy/video_model.dart';
import 'package:flutter/material.dart';

class RelatedVideo extends StatelessWidget {
  const RelatedVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children:  [
        RelatedVideoContainer(
          videoModel: VideoModel(
              title: 'Golang Tutorial',
              imageUrl:
              "https://mestergraph.com/uploads/pictures/teklonozhiiiiiiiiiiii/shabake/master_groph_8-8_1.jpg",
              viewCount: 24,
              duration: '45:20',
              publishTime: DateTime.now().subtract(const Duration(days: 45))
          ),
        ),
        RelatedVideoContainer(
          videoModel: VideoModel(
              title: 'Golang Tutorial',
              imageUrl:
              "https://mestergraph.com/uploads/pictures/teklonozhiiiiiiiiiiii/shabake/master_groph_8-8_1.jpg",
              viewCount: 24,
              duration: '45:20',
              publishTime: DateTime.now().subtract(const Duration(days: 45))
          ),
        ),
        RelatedVideoContainer(
          videoModel: VideoModel(
              title: 'Golang Tutorial',
              imageUrl:
              "https://mestergraph.com/uploads/pictures/teklonozhiiiiiiiiiiii/shabake/master_groph_8-8_1.jpg",
              viewCount: 24,
              duration: '45:20',
              publishTime: DateTime.now().subtract(const Duration(days: 45))
          ),
        ),
      ],
    );
  }
}
