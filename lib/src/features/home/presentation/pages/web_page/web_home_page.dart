import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/core/core.dart';
import 'package:academy/src/features/home/presentation/bloc/home_state.dart';
import 'package:academy/src/features/video_details/presentation/bloc/video_details_cubit.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:academy/video_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/home_cubit.dart';

class WebHomePage extends StatefulWidget {
  const WebHomePage({super.key});

  @override
  State<WebHomePage> createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage> {
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
    getIt<HomeCubit>().getVideos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final crossCount = (MediaQuery.of(context).size.width ~/ 280).toInt();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).academy),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.whenOrNull(
                loading: () => const ACLoading(),
                done: () => Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          7,
                          (index) => GestureDetector(
                            onTap: () {
                              VideoDetailsCubit.url = videoModels[index].url!;
                              context.pushNamed('videoDetails',
                                  extra: videoModels[index]);
                            },
                            child: Container(
                                padding: const EdgeInsets.all(12),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
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
                    Expanded(
                      child: GridView.builder(
                        itemCount: HomeCubit.videos.length,
                        itemBuilder: (context, index) => RelatedVideoContainer(
                          margin: 8,
                          videoModel: HomeCubit.videos[index],
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossCount == 0 ? 1 : crossCount,
                          childAspectRatio: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ) ??
              const SizedBox();
        },
      ),
    );
  }
}
