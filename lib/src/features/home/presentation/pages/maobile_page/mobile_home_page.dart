import 'package:academy/src/core/extensions/extensions.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:flutter/material.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Academy'), centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
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
              (AppSize.s60).heightSizeBox(),
            ],
          ),
        ),
      ),
    );
  }
}
