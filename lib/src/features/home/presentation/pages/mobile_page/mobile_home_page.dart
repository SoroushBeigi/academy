import 'dart:math';

import 'package:academy/src/core/extensions/extensions.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/home/presentation/bloc/home_state.dart';
import 'package:academy/src/features/main/presentation/bloc/main_cubit.dart';
import 'package:academy/src/features/search/presentation/cubit/search_cubit.dart';
import 'package:academy/src/features/search/presentation/widgets/search_field.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:academy/content_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/ui_kits/ac_loading/ac_loading.dart';
import '../../bloc/home_cubit.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
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
                loading: () => shimmerWidget(context),
                initial: () => const ACLoading(),
                done: () {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: GestureDetector(
                          onTap: () {
                            context.go('/search', extra: {
                              'isFromHome': true,
                              'selectedChip': null
                            });
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
                      AppSize.s4.heightSizeBox(),
                      idleChips(context),
                      AppSize.s4.heightSizeBox(),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: RefreshIndicator(
                            onRefresh: () =>
                                context.read<HomeCubit>().initial(),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  categorySection(context, 'New',
                                      HomeCubit.videos.sublist(0)),
                                  categorySection(context, 'Trending',
                                      HomeCubit.videos.sublist(3)),
                                  categorySection(context, 'Top Rated',
                                      HomeCubit.videos.sublist(6)),
                                  categorySection(context, 'For You',
                                      HomeCubit.videos.sublist(1)),
                                ],
                              ),
                            ),
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
    );
  }

  categorySection(
          BuildContext context, String title, List<ContentEntity> models) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                  .map(
                    (e) => Container(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        width: 350,
                        child: RelatedVideoContainer(videoModel: e)),
                  )
                  .toList(),
            ),
          ],
        ),
      );

  idleChips(BuildContext context) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: HomeCubit.chips.entries
                .map(
                  (e) => Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: FilterChip(
                      label: Text(e.key),
                      onSelected: (_) {
                        getIt<SearchCubit>().selectChip(e.key);
                        context.go('/search',
                            extra: {'isFromHome': true, 'selectedChip': e.key});
                        context.read<MainCubit>().updateNavigationIndexState(1);
                      },
                      selected: false,
                    ),
                  ),
                )
                .toList()),
      );

  shimmerWidget(BuildContext context) {
    final random = Random();
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      highlightColor: Theme.of(context).colorScheme.surfaceContainerLow,
      period: const Duration(milliseconds: 1000),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: const EdgeInsets.all(16),
              child: const SearchField(
                enabled: false,
                autoFocus: false,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  10,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: FilterChip(
                        label: SizedBox(
                          width: random.nextDouble() * 100,
                        ),
                        onSelected: null),
                  ),
                ),
              ),
            ),
            categorySection(
                context, '', List.generate(10, (_) => ContentEntity()))
          ],
        ),
      ),
    );
  }
}
