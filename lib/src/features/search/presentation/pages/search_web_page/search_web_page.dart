import 'package:academy/src/core/extensions/extensions.dart';
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
                  hintText: 'Start searching...',
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
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: crossCount == 0 ? 1 : crossCount,
                childAspectRatio: 1.15,
                children: const [
                  RelatedVideoContainer(
                    imageTitle: "https://mestergraph.com/uploads/pictures/teklonozhiiiiiiiiiiii/shabake/master_groph_8-8_1.jpg",
                    title: 'Golang Tutorial',
                    duration: '45:35',
                    viewsNumber: '125',
                    publisherName: 'Amirhossein',
                    publisherTime: '1 month ago',
                    isLive: false,
                  ),
                  RelatedVideoContainer(
                    imageTitle: "https://mestergraph.com/uploads/pictures/teklonozhiiiiiiiiiiii/shabake/master_groph_8-8_1.jpg",
                    title: 'Golang Tutorial',
                    duration: '45:35',
                    viewsNumber: '125',
                    publisherName: 'Amirhossein',
                    publisherTime: '1 month ago',
                    isLive: false,
                  ),
                  RelatedVideoContainer(
                    imageTitle: "https://mestergraph.com/uploads/pictures/teklonozhiiiiiiiiiiii/shabake/master_groph_8-8_1.jpg",
                    title: 'Golang Tutorial',
                    duration: '45:35',
                    viewsNumber: '125',
                    publisherName: 'Amirhossein',
                    publisherTime: '1 month ago',
                    isLive: false,
                  ),
                  RelatedVideoContainer(
                    imageTitle: "https://mestergraph.com/uploads/pictures/teklonozhiiiiiiiiiiii/shabake/master_groph_8-8_1.jpg",
                    title: 'Golang Tutorial',
                    duration: '45:35',
                    viewsNumber: '125',
                    publisherName: 'Amirhossein',
                    publisherTime: '1 month ago',
                    isLive: true,
                  ),
                  RelatedVideoContainer(
                    imageTitle: "https://mestergraph.com/uploads/pictures/teklonozhiiiiiiiiiiii/shabake/master_groph_8-8_1.jpg",
                    title: 'Golang Tutorial',
                    duration: '45:35',
                    viewsNumber: '125',
                    publisherName: 'Amirhossein',
                    publisherTime: '1 month ago',
                    isLive: false,
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
