import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:flutter/material.dart';
class FavouriteWebPage extends StatelessWidget {
  const FavouriteWebPage({super.key});

  @override
  Widget build(BuildContext context) {
    final crossCount = (MediaQuery.of(context).size.width ~/ 350).toInt();
    return Scaffold(
        body: GridView.count(
          crossAxisCount: crossCount==0? 1 : crossCount,
          childAspectRatio: 1.18,
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
          ],
        )
    );
  }
}
