import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/home/presentation/bloc/home_state.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/ui_kits/ac_loading/ac_loading.dart';
import '../../bloc/home_cubit.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  @override
  void initState() {
    print('init');
    super.initState();
    getIt<HomeCubit>().getVideos();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
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
                    return SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: HomeCubit.videos.length,
                        itemBuilder: (context, index) => RelatedVideoContainer(
                          margin: 8,
                          videoModel: HomeCubit.videos[index],
                        ),
                      ),
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
