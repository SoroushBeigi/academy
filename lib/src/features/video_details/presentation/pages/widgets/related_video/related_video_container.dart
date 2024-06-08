import 'package:academy/src/core/logic/common/date_format.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/features/home/presentation/pages/mobile_page/widgets/more_widget.dart';
import 'package:academy/video_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/ui_kits/ac_loading/ac_loading.dart';
import '../../../bloc/video_details_cubit.dart';

class RelatedVideoContainer extends StatelessWidget {
  const RelatedVideoContainer({
    super.key,
    required this.videoModel,
  });

  final VideoModel videoModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        VideoDetailsCubit.url = videoModel.url!;
        print(VideoDetailsCubit.url);
        context.pushNamed('videoDetails',extra: videoModel,);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
            vertical: AppPadding.p8, horizontal: AppPadding.p8),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12), bottom: Radius.zero),
                    child: CachedNetworkImage(
                      fit: BoxFit.contain,
                      imageUrl:
                          // videoModel.imageUrl ??
                          "https://mestergraph.com/uploads/pictures/teklonozhiiiiiiiiiiii/shabake/master_groph_8-8_1.jpg",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
                          ),
                        ),
                      ),
                      placeholder: (context, url) => const ACLoading(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(AppPadding.p8),
                      child: videoModel.isLive == true
                          ? Container(
                              margin: const EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                  color: Colors.red[700]!,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.settings_input_antenna,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'LIVE',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.only(left: 8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.75),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                videoModel.duration ?? '01:30',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Text(videoModel.title ?? 'title',
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
              child: Row(
                children: [
                  // Text('$publisherName ---'),
                  Text('${videoModel.viewCount ?? 0} views ---'),
                  Text(DateFormat.timeAgo(
                      videoModel.publishTime ?? DateTime.now())),
                  const Spacer(),
                  const MoreWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
