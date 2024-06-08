import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:flutter/material.dart';

class WebHomePage extends StatelessWidget {
  const WebHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final crossCount = (MediaQuery.of(context).size.width ~/ 350).toInt();
    return Scaffold(
      appBar: AppBar(title: const Text('Academy')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GridView.count(
          crossAxisCount: crossCount == 0 ? 1 : crossCount,
          childAspectRatio: 1.15,
          children: const [
            const RelatedVideoContainer(
              imageTitle: "https://mestergraph.com/uploads/pictures/teklonozhiiiiiiiiiiii/shabake/master_groph_8-8_1.jpg",
              title: 'Golang Tutorial',
              duration: '45:35',
              viewsNumber: '125',
              publisherName: 'Amirhossein',
              publisherTime: '1 month ago',
              isLive: false,
            ),
            const RelatedVideoContainer(
              imageTitle: "https://mestergraph.com/uploads/pictures/teklonozhiiiiiiiiiiii/shabake/master_groph_8-8_1.jpg",
              title: 'Golang Tutorial',
              duration: '45:35',
              viewsNumber: '125',
              publisherName: 'Amirhossein',
              publisherTime: '1 month ago',
              isLive: false,
            ),
            const RelatedVideoContainer(
              imageTitle: "https://mestergraph.com/uploads/pictures/teklonozhiiiiiiiiiiii/shabake/master_groph_8-8_1.jpg",
              title: 'Golang Tutorial',
              duration: '45:35',
              viewsNumber: '125',
              publisherName: 'Amirhossein',
              publisherTime: '1 month ago',
              isLive: false,
            ),
            const RelatedVideoContainer(
              imageTitle: "https://mestergraph.com/uploads/pictures/teklonozhiiiiiiiiiiii/shabake/master_groph_8-8_1.jpg",
              title: 'Golang Tutorial',
              duration: '45:35',
              viewsNumber: '125',
              publisherName: 'Amirhossein',
              publisherTime: '1 month ago',
              isLive: true,
            ),
            const RelatedVideoContainer(
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
    );
  }
}
