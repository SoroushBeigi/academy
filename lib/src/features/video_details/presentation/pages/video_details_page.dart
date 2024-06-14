import 'package:academy/src/core/data/local/shared_pref.dart';
import 'package:academy/src/core/extensions/extensions.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/core/widgets/responsive_widget/responsive_widget.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/video_details/presentation/bloc/video_details_cubit.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/description_video.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/video_player_widget/video_player_widget.dart';
import 'package:academy/content_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rxdart/rxdart.dart';

import 'widgets/comment_container.dart';

class VideoDetails extends StatelessWidget {
  const VideoDetails({required this.videoModel, super.key});

  final ContentEntity videoModel;

  @override
  Widget build(BuildContext context) {
    final BehaviorSubject<int> likeSubject = BehaviorSubject<int>.seeded(0);
    final savedId = getIt<Storage>().getSavedVideos().firstWhere(
          (element) => element == videoModel.id.toString(),
          orElse: () => '',
        );
    final BehaviorSubject<bool> saveSubject =
        BehaviorSubject<bool>.seeded(savedId != '');
    return BlocProvider(
      create: (context) => getIt<VideoDetailsCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(videoModel.title ?? ''),
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s12),
                  ),
                  child: VideoPlayerWidget(isLive: videoModel.isLive),
                ),
                Divider(
                  thickness: AppSize.s1,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                DescriptionVideo(videoModel: videoModel),
                (AppSize.s12).heightSizeBox(),
                ResponsiveWidget(
                  smallScreen: smallCards(context, likeSubject, saveSubject),
                  largeScreen: largeCards(context, likeSubject, saveSubject),
                ),
                AppSize.s8.heightSizeBox(),
                Divider(
                  color: Colors.grey[400],
                  indent: 32,
                  endIndent: 32,
                ),
                AppSize.s4.heightSizeBox(),
                Text(
                  AppLocalizations.of(context).comments,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                AppSize.s8.heightSizeBox(),
                ResponsiveWidget(
                  smallScreen: commentCard(context,true),
                  mediumScreen: commentCard(context,false),
                  largeScreen: commentCard(context,false),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  smallCards(BuildContext context, likeSubject, saveSubject) => Column(
        children: [
          docCard(context, likeSubject, saveSubject),
          (AppSize.s8).heightSizeBox(),
          // commentCard(context, 180),
          similarVideos(context),
        ],
      );

  largeCards(BuildContext context, likeSubject, saveSubject) => Row(
        children: [
          Expanded(child: docCard(context, likeSubject, saveSubject)),
          AppSize.s8.widthSizeBox(),
          // Expanded(child: commentCard(context, 150))
          Expanded(
            child: similarVideos(context),
          )
        ],
      );

  similarVideos(BuildContext context) {
    final large = Row(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width >= 650
                ? 400
                : double.infinity,
            child: RelatedVideoContainer(
              videoModel: videoModel,
              margin: 8,
            )),
        SizedBox(
            width: MediaQuery.of(context).size.width >= 650
                ? 400
                : double.infinity,
            child: RelatedVideoContainer(videoModel: videoModel, margin: 8)),
      ],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context).similarVideos,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.start,
        ),
        AppSize.s8.heightSizeBox(),
        ResponsiveWidget(
          largeScreen: large,
          mediumScreen: large,
          smallScreen: Column(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width >= 650
                      ? 400
                      : double.infinity,
                  child: RelatedVideoContainer(
                    videoModel: videoModel,
                    margin: 8,
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width >= 650
                      ? 400
                      : double.infinity,
                  child:
                      RelatedVideoContainer(videoModel: videoModel, margin: 8)),
            ],
          ),
        ),
      ],
    );
  }

  docCard(context, likeSubject, saveSubject) => Column(
        children: [
          StreamBuilder<int>(
              stream: likeSubject.stream,
              builder: (context, snapshot) {
                return ResponsiveWidget(
                  smallScreen: rowWidget(context, snapshot, likeSubject,
                      saveSubject, MediaQuery.of(context).size.width),
                  largeScreen: rowWidget(context, snapshot, likeSubject,
                      saveSubject, MediaQuery.of(context).size.width / 2),
                );
              }),
          AppSize.s24.heightSizeBox(),
          Container(
            padding: const EdgeInsets.all(AppPadding.p8),
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s12),
              color: Theme.of(context).colorScheme.surfaceContainer,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).documents,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                (AppSize.s12).heightSizeBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/pdf.png',
                          width: 50,
                          height: 50,
                        ),
                        (AppSize.s4).heightSizeBox(),
                        const Text('PDF')
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/word.png',
                          width: 50,
                          height: 50,
                        ),
                        (AppSize.s4).heightSizeBox(),
                        const Text('DOCX')
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/powerpoint.png',
                          width: 50,
                          height: 50,
                        ),
                        (AppSize.s4).heightSizeBox(),
                        const Text('PPTX')
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );

  commentCard(BuildContext context, bool isMobile) => Container(
        padding: const EdgeInsets.all(AppPadding.p8),
        width: isMobile
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s12),
          color: Theme.of(context).colorScheme.surfaceContainer,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).comment,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            AppSize.s12.heightSizeBox(),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSize.s12),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  hintText: AppLocalizations.of(context).addComment),
            ),
            AppSize.s16.heightSizeBox(),
            Align(
              alignment: AppConstants.isFa
                  ? Alignment.bottomLeft
                  : Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(AppLocalizations.of(context).submit),
              ),
            ),
            const CommentContainer(),
            const CommentContainer(),
            const CommentContainer(),
            const CommentContainer(),
            const CommentContainer(),
            const CommentContainer(),
          ],
        ),
      );

  rowWidget(context, snapshot, likeSubject, saveSubject, width) => SizedBox(
        width: width,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
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
              flex: 1,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
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
              flex: 2,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
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
              flex: 2,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
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
                                  : Theme.of(context).colorScheme.onSurface,
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
        ),
      );
}
