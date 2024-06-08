import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:academy/video_model.dart';
import 'package:flutter/material.dart';

class FavouriteWebPage extends StatelessWidget {
  const FavouriteWebPage({super.key});

  @override
  Widget build(BuildContext context) {
    final crossCount = (MediaQuery.of(context).size.width ~/ 350).toInt();
    return Scaffold(
        body: GridView.count(
      crossAxisCount: crossCount == 0 ? 1 : crossCount,
      childAspectRatio: 1.18,
      children: [
        RelatedVideoContainer(
          videoModel: VideoModel(
              title: 'Golang Tutorial',
              imageUrl:
                  "https://mestergraph.com/uploads/pictures/teklonozhiiiiiiiiiiii/shabake/master_groph_8-8_1.jpg",
              viewCount: 24,
              duration: '45:20',
              publishTime: DateTime.now().subtract(const Duration(days: 45))),
        ),
        RelatedVideoContainer(
          videoModel: VideoModel(
              title: 'Golang Tutorial',
              imageUrl:
                  "https://mestergraph.com/uploads/pictures/teklonozhiiiiiiiiiiii/shabake/master_groph_8-8_1.jpg",
              viewCount: 24,
              duration: '45:20',
              publishTime: DateTime.now().subtract(const Duration(days: 45))),
        ),
      ],
    ));
  }
}
