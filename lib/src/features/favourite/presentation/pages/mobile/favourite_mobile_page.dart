import 'package:academy/src/core/extensions/widget_extensions.dart';
import 'package:academy/src/core/resources/value_manager.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:academy/video_model.dart';
import 'package:flutter/material.dart';

class FavouriteMobilePage extends StatelessWidget {
  const FavouriteMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              RelatedVideoContainer(
                videoModel: VideoModel(
                  title: 'Golang Tutorial',
                  imageUrl:
                      "https://mestergraph.com/uploads/pictures/teklonozhiiiiiiiiiiii/shabake/master_groph_8-8_1.jpg",
                  viewCount: 24,
                  duration: '45:20',
                  publishTime:
                      DateTime.now().subtract(const Duration(days: 45)),
                ),
              ),
              (AppSize.s60).heightSizeBox(),
            ],
          ),
        ),
      ),
    );
  }
}
