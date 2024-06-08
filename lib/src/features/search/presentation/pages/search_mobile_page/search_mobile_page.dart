import 'package:academy/src/core/extensions/extensions.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:academy/video_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchMobilePage extends StatelessWidget {
  const SearchMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context).startSearching,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12)),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 1.0,
                    ),
                  ),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: AppPadding.p8, horizontal: AppPadding.p18),
                ),
              ),
              const SizedBox(height: 12),
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
              (AppSize.s60).heightSizeBox(),
            ],
          ),
        ),
      ),
    );
  }
}
