import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:flutter/material.dart';

class RelatedVideo extends StatelessWidget {
  const RelatedVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
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
    );
  }
}
