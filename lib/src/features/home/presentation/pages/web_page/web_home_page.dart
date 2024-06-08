import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../bloc/home_cubit.dart';

class WebHomePage extends StatelessWidget {
  const WebHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<HomeCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).academy),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GridView.builder(
          // crossAxisCount: crossCount == 0 ? 1 : crossCount,
          // childAspectRatio: 1.25,
          itemBuilder: (context, index) =>  RelatedVideoContainer(
            videoModel:cubit.videos[index],
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent:
                  (MediaQuery.of(context).size.width ~/ 350).toDouble()),
          // children: const [
          //   RelatedVideoContainer(
          //     imageTitle: "https://mestergraph.com/uploads/pictures/teklonozhiiiiiiiiiiii/shabake/master_groph_8-8_1.jpg",
          //     title: 'Golang Tutorial',
          //     duration: '45:35',
          //     viewsNumber: '125',
          //     publisherName: 'Amirhossein',
          //     publisherTime: '1 month ago',
          //     isLive: false,
          //   ),
          //   RelatedVideoContainer(
          //     imageTitle: "https://mestergraph.com/uploads/pictures/teklonozhiiiiiiiiiiii/shabake/master_groph_8-8_1.jpg",
          //     title: 'Golang Tutorial',
          //     duration: '45:35',
          //     viewsNumber: '125',
          //     publisherName: 'Amirhossein',
          //     publisherTime: '1 month ago',
          //     isLive: false,
          //   ),
          //   RelatedVideoContainer(
          //     imageTitle: "https://mestergraph.com/uploads/pictures/teklonozhiiiiiiiiiiii/shabake/master_groph_8-8_1.jpg",
          //     title: 'Golang Tutorial',
          //     duration: '45:35',
          //     viewsNumber: '125',
          //     publisherName: 'Amirhossein',
          //     publisherTime: '1 month ago',
          //     isLive: false,
          //   ),
          //   RelatedVideoContainer(
          //     imageTitle: "https://mestergraph.com/uploads/pictures/teklonozhiiiiiiiiiiii/shabake/master_groph_8-8_1.jpg",
          //     title: 'Golang Tutorial',
          //     duration: '45:35',
          //     viewsNumber: '125',
          //     publisherName: 'Amirhossein',
          //     publisherTime: '1 month ago',
          //     isLive: true,
          //   ),
          //   RelatedVideoContainer(
          //     imageTitle: "https://mestergraph.com/uploads/pictures/teklonozhiiiiiiiiiiii/shabake/master_groph_8-8_1.jpg",
          //     title: 'Golang Tutorial',
          //     duration: '45:35',
          //     viewsNumber: '125',
          //     publisherName: 'Amirhossein',
          //     publisherTime: '1 month ago',
          //     isLive: false,
          //   ),
          // ],
        ),
      ),
    );
  }
}
