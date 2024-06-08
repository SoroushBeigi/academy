import 'package:academy/video_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:flutter/material.dart';

class SearchWebPage extends StatelessWidget {
  const SearchWebPage({super.key});

  @override
  Widget build(BuildContext context) {
    final crossCount = (MediaQuery.of(context).size.width ~/ 350).toInt();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context).startSearching,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(AppSize.s12)),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 1.0,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: AppPadding.p8, horizontal: AppPadding.p18),
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: crossCount == 0 ? 1 : crossCount,
                childAspectRatio: 1.15,
                children: [
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
