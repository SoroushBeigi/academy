import 'package:academy/src/core/extensions/extensions.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/core/resources/value_manager.dart';
import 'package:academy/src/core/widgets/responsive_widget/responsive_widget.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/video_details/presentation/bloc/video_details_cubit.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/description_video.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/video_player_widget/video_player_widget.dart';
import 'package:academy/video_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VideoDetails extends StatelessWidget {
  const VideoDetails({required this.videoModel, super.key});

  final VideoModel videoModel;

  @override
  Widget build(BuildContext context) {
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
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s12),
                  ),
                  child: const VideoPlayerWidget(),
                ),
                Divider(
                  thickness: AppSize.s1,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                DescriptionVideo(videoModel: videoModel),
                (AppSize.s12).heightSizeBox(),
                ResponsiveWidget(
                  smallScreen: smallCards(context),
                  largeScreen: largeCards(context),
                ),
                AppSize.s8.heightSizeBox(),
                Divider(
                  color: Colors.grey[400],
                  indent: 32,
                  endIndent: 32,
                ),
                AppSize.s4.heightSizeBox(),
                Text(
                  AppLocalizations.of(context).similarVideos,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                AppSize.s8.heightSizeBox(),
                similarVideos(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  smallCards(BuildContext context) => Column(
        children: [
          docCard(context),
          (AppSize.s8).heightSizeBox(),
          commentCard(context),
        ],
      );

  largeCards(BuildContext context) => Row(
        children: [
          Expanded(child: docCard(context)),
          AppSize.s8.widthSizeBox(),
          Expanded(child: commentCard(context))
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
    return ResponsiveWidget(
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
              child: RelatedVideoContainer(videoModel: videoModel, margin: 8)),
        ],
      ),
    );
  }

  docCard(context) => Container(
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
      );

  commentCard(BuildContext context) => Container(
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
              alignment:AppConstants.isFa? Alignment.bottomLeft : Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(AppLocalizations.of(context).submit),
              ),
            ),
          ],
        ),
      );
}
