import 'package:academy/src/core/extensions/extensions.dart';
import 'package:academy/src/core/logic/common/date_format.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/video_model.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class DescriptionVideo extends StatelessWidget {
  const DescriptionVideo({required this.videoModel, super.key});

  final VideoModel videoModel;

  @override
  Widget build(BuildContext context) {
    final BehaviorSubject<int> likeSubject = BehaviorSubject<int>.seeded(0);
    final BehaviorSubject<bool> saveSubject = BehaviorSubject<bool>.seeded(false);
    return Column(
      children: [
        Text(
          videoModel.title ?? 'How to learn Golang',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '${videoModel.viewCount ?? 24} views ${DateFormat.timeAgo(
                videoModel.publishTime ??
                    DateTime.now().subtract(
                      const Duration(days: 5),
                    ),
              )}',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                '...more',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            )
          ],
        ),
        StreamBuilder<int>(
            stream: likeSubject.stream,
            builder: (context, snapshot) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: AppPadding.p4),
                      padding: const EdgeInsets.all(AppPadding.p6),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainer,
                        borderRadius: BorderRadius.circular(AppSize.s60),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              likeSubject.add(1);
                            },
                            child: Icon(
                              Icons.thumb_up_alt_outlined,
                              color: snapshot.data == 1
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          VerticalDivider(
                            thickness: 2,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          InkWell(
                            onTap: () {
                              likeSubject.add(-1);
                            },
                            child: Icon(
                              Icons.thumb_down_alt_outlined,
                              color: snapshot.data == -1
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: AppPadding.p4),
                      padding: const EdgeInsets.all(AppPadding.p6),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainer,
                        borderRadius: BorderRadius.circular(AppSize.s60),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.share),
                            (AppSize.s4).widthSizeBox(),
                            const Text('Share')
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: AppPadding.p4),
                      padding: const EdgeInsets.all(AppPadding.p6),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainer,
                        borderRadius: BorderRadius.circular(AppSize.s60),
                      ),
                      child: StreamBuilder<bool>(
                          stream: saveSubject.stream,
                          builder: (context, snapshot) {
                            return InkWell(
                              onTap: () {
                                saveSubject.add(!snapshot.data!);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.bookmark_border,
                                    color: snapshot.data ?? false
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                  ),
                                  (AppSize.s4).widthSizeBox(),
                                  Text(
                                    'Save',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: snapshot.data ?? false
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .primary
                                                : Theme.of(context)
                                                    .colorScheme
                                                    .onSurface),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  )
                ],
              );
            }),
      ],
    );
  }
}
