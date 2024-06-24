import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/features/core/core.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget(
      {super.key,
        required this.imageTitle,
        required this.title,
        required this.duration,
        required this.viewsNumber,
        required this.publisherName,
        required this.publisherTime,
        required this.isLive});

  final String imageTitle;
  final String title;
  final String duration;
  final String viewsNumber;
  final String publisherName;
  final String publisherTime;
  final bool isLive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppPadding.p12),
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
                CachedNetworkImage(
                  fit: BoxFit.contain,
                  imageUrl: imageTitle,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const ACLoading(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: isLive == true
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
                        duration,
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
            child: Text(title, style: Theme.of(context).textTheme.titleMedium),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
            child: Row(
              children: [
                Text('$publisherName • '),
                Text('$viewsNumber views • '),
                Text(publisherTime),
              ],
            ),
          )
        ],
      ),
    );
  }
}
