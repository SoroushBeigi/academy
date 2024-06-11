import 'package:academy/src/core/extensions/extensions.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/home/presentation/bloc/home_state.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:academy/video_model.dart';
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
  final List<VideoModel> videoModels = [
    VideoModel(
        url:
            'https://res.cloudinary.com/dannykeane/video/upload/sp_full_hd/q_80:qmax_90,ac_none/v1/dk-memoji-dark.m3u8',
        isLive: true),
    VideoModel(
        url:
            'https://diceyk6a7voy4.cloudfront.net/e78752a1-2e83-43fa-85ae-3d508be29366/hls/fitfest-sample-1_Ott_Hls_Ts_Avc_Aac_16x9_1280x720p_30Hz_6.0Mbps_qvbr.m3u8',
        isLive: true),
    VideoModel(
        url: 'https://test-streams.mux.dev/pts_shift/master.m3u8',
        isLive: true),
    VideoModel(
        url:
            'https://test-streams.mux.dev/issue666/playlists/cisq0gim60007xzvi505emlxx.m3u8',
        isLive: true),
    VideoModel(
        url:
            'https://test-streams.mux.dev/dai-discontinuity-deltatre/manifest.m3u8',
        isLive: true),
    VideoModel(
        url: 'https://test-streams.mux.dev/test_001/stream.m3u8', isLive: true),
    VideoModel(
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
        title: Text(AppLocalizations.of(context).academy),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state.whenOrNull(
                  loading: () => const ACLoading(),
                  done: () {
                    return Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              7,
                              (index) => GestureDetector(
                                onTap: () => context.pushNamed('videoDetails',
                                    extra: videoModels[index]),
                                child: Container(
                                    padding: const EdgeInsets.all(12),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey[800]!, width: 2),
                                        borderRadius: BorderRadius.circular(30),
                                        color: index % 2 == 0
                                            ? Colors.red[500]
                                            : Colors.red[800]),
                                    child: const Icon(
                                      Icons.live_tv,
                                      size: 35,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                        ),
                        AppSize.s8.heightSizeBox(),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: HomeCubit.videos.length,
                            itemBuilder: (context, index) =>
                                RelatedVideoContainer(
                              margin: 8,
                              videoModel: HomeCubit.videos[index],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ) ??
                const SizedBox();
          },
        ),
      ),
    );
  }
}
