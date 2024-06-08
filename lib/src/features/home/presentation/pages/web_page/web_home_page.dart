import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/core/core.dart';
import 'package:academy/src/features/home/presentation/bloc/home_state.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../bloc/home_cubit.dart';

class WebHomePage extends StatefulWidget {
  const WebHomePage({super.key});

  @override
  State<WebHomePage> createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage> {
  @override
  void initState() {
    print('init');
    getIt<HomeCubit>().getVideos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    final cubit = context.read<HomeCubit>();
    final crossCount = (MediaQuery.of(context).size.width ~/ 350).toInt();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).academy),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          print(cubit.videos.length);
          return state.whenOrNull(
                loading: () => const ACLoading(),
                done: () => GridView.builder(
                  itemCount: cubit.videos.length,
                  itemBuilder: (context, index) => RelatedVideoContainer(
                    videoModel: cubit.videos[index],
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossCount==0? 1 :crossCount),

                ),
              ) ??
              const SizedBox();
        },
      ),
    );
  }
}
