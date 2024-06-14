import 'package:academy/src/core/extensions/extensions.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/home/presentation/bloc/home_state.dart';
import 'package:academy/src/features/main/presentation/bloc/main_cubit.dart';
import 'package:academy/src/features/search/presentation/widgets/search_field.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:academy/content_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui_kits/ac_loading/ac_loading.dart';
import '../../bloc/home_cubit.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  final List<ContentEntity> videoModels = [
    ContentEntity(
        url:
            'https://res.cloudinary.com/dannykeane/video/upload/sp_full_hd/q_80:qmax_90,ac_none/v1/dk-memoji-dark.m3u8',
        isLive: true),
    ContentEntity(
        url:
            'https://diceyk6a7voy4.cloudfront.net/e78752a1-2e83-43fa-85ae-3d508be29366/hls/fitfest-sample-1_Ott_Hls_Ts_Avc_Aac_16x9_1280x720p_30Hz_6.0Mbps_qvbr.m3u8',
        isLive: true),
    ContentEntity(
        url: 'https://test-streams.mux.dev/pts_shift/master.m3u8',
        isLive: true),
    ContentEntity(
        url:
            'https://test-streams.mux.dev/issue666/playlists/cisq0gim60007xzvi505emlxx.m3u8',
        isLive: true),
    ContentEntity(
        url:
            'https://test-streams.mux.dev/dai-discontinuity-deltatre/manifest.m3u8',
        isLive: true),
    ContentEntity(
        url: 'https://test-streams.mux.dev/test_001/stream.m3u8', isLive: true),
    ContentEntity(
        url: 'https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8', isLive: true),
  ];

  @override
  void initState() {
    super.initState();
    getIt<HomeCubit>().getVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: AppBar().preferredSize.height,
              height: AppBar().preferredSize.height,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset('assets/icon.png')),
            ),
            AppSize.s4.widthSizeBox(),
            Text(AppLocalizations.of(context).academy),
          ],
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.whenOrNull(
                loading: () => const ACLoading(),
                done: () {
                  return Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 16),
                        child: GestureDetector(
                          onTap: () {
                            context.go('/search', extra: true);
                            context
                                .read<MainCubit>()
                                .updateNavigationIndexState(1);
                          },
                          child: const SearchField(
                            enabled: false,
                            autoFocus: false,
                          ),
                        ),
                      ),
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Row(
                      //     children: List.generate(
                      //       7,
                      //       (index) => GestureDetector(
                      //         onTap: () {
                      //           VideoDetailsCubit.url =
                      //               videoModels[index].url!;
                      //           context.pushNamed('videoDetails',
                      //               extra: videoModels[index]);
                      //         },
                      //         child: Container(
                      //             padding: const EdgeInsets.all(12),
                      //             margin: const EdgeInsets.symmetric(
                      //                 horizontal: 8),
                      //             decoration: BoxDecoration(
                      //                 border: Border.all(
                      //                     color: Colors.grey[800]!, width: 2),
                      //                 borderRadius: BorderRadius.circular(30),
                      //                 color: index % 2 == 0
                      //                     ? Colors.red[500]
                      //                     : Colors.red[800]),
                      //             child: const Icon(
                      //               Icons.live_tv,
                      //               size: 35,
                      //               color: Colors.white,
                      //             )),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      AppSize.s8.heightSizeBox(),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                categorySection(context,'Live',HomeCubit.videos.sublist(1,5)),
                                categorySection(context,'Education',HomeCubit.videos.sublist(0,5)),
                                categorySection(context,'Entertainment',HomeCubit.videos.sublist(2,4)),
                                categorySection(context,'Music',HomeCubit.videos.sublist(1,4)),
                                categorySection(context,'Nature',HomeCubit.videos.sublist(2,5)),
                              ],
                            ),
                          ),
                          // child: ListView.builder(
                          //   padding: const EdgeInsets.only(bottom: 100),
                          //   shrinkWrap: true,
                          //   itemCount: HomeCubit.videos.length,
                          //   itemBuilder: (context, index) =>
                          //       RelatedVideoContainer(
                          //     margin: 8,
                          //     videoModel: HomeCubit.videos[index],
                          //   ),
                          // ),
                        ),
                      ),
                    ],
                  );
                },
              ) ??
              const SizedBox();
        },
      ),
    );
  }
  categorySection(
      BuildContext context, String title, List<ContentEntity> models) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            AppSize.s8.heightSizeBox(),
            Column(
              children: models
                  .map((e) => Container(padding: EdgeInsets.symmetric(vertical: 4),width: 350,child: RelatedVideoContainer(videoModel: e)),)
                  .toList(),
            ),
          ],
        ),
      );
}
