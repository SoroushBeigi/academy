import 'package:academy/src/core/data/local/shared_pref.dart';
import 'package:academy/src/core/extensions/extensions.dart';
import 'package:academy/src/core/logic/common/date_format.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/video_details/presentation/bloc/video_details_cubit.dart';
import 'package:academy/video_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DescriptionVideo extends StatelessWidget {
  const DescriptionVideo({required this.videoModel, super.key});

  final VideoModel videoModel;

  @override
  Widget build(BuildContext context) {
    final BehaviorSubject<int> likeSubject = BehaviorSubject<int>.seeded(0);
    final savedId = getIt<Storage>().getSavedVideos().firstWhere(
          (element) => element == videoModel.id.toString(),
          orElse: () => '',
        );
    final BehaviorSubject<bool> saveSubject =
        BehaviorSubject<bool>.seeded(savedId != '');
    return Column(
      children: [
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
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:  ReadMoreText(
            'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.' ??
                '',
            trimMode: TrimMode.Line,
            trimLines: 2,
            trimCollapsedText: AppLocalizations.of(context).showMore,
            trimExpandedText: AppLocalizations.of(context).showLess,
            colorClickableText: Theme.of(context).colorScheme.primary,
          ),
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
                      child: InkWell(
                        onTap: () {
                          likeSubject.add(1);
                        },
                        child: Icon(
                          snapshot.data == 1
                              ? Icons.thumb_up_alt
                              : Icons.thumb_up_alt_outlined,
                          color: snapshot.data == 1
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onSurface,
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
                      child: InkWell(
                        onTap: () {
                          likeSubject.add(-1);
                        },
                        child: Icon(
                          snapshot.data == -1
                              ? Icons.thumb_down_alt
                              : Icons.thumb_down_alt_outlined,
                          color: snapshot.data == -1
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onSurface,
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
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.share),
                            (AppSize.s4).widthSizeBox(),
                            Text(AppLocalizations.of(context).share)
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
                                context
                                    .read<VideoDetailsCubit>()
                                    .saveVideo(videoModel.id);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    snapshot.data ?? false
                                        ? Icons.bookmark
                                        : Icons.bookmark_border,
                                    color: snapshot.data ?? false
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                  ),
                                  (AppSize.s4).widthSizeBox(),
                                  Text(
                                    AppLocalizations.of(context).save,
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
