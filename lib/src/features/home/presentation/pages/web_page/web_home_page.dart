import 'dart:math';

import 'package:academy/src/core/extensions/widget_extensions.dart';
import 'package:academy/src/core/widgets/app_header.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/core/core.dart';
import 'package:academy/src/features/saved/domain/entity/content/response/content_response_entity.dart';
import 'package:academy/src/features/home/presentation/bloc/home_state.dart';
import 'package:academy/src/features/search/presentation/cubit/search_cubit.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/resources/resources.dart';
import '../../bloc/home_cubit.dart';

class WebHomePage extends StatefulWidget {
  const WebHomePage({super.key});

  @override
  State<WebHomePage> createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage> {
  late String username;
  late int userId;

  loadUserInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    username = pref.getString('username') ?? '-';
    userId = pref.getInt('id') ?? -1;
  }

  @override
  void initState() {
    // getIt<HomeCubit>().initial();

    super.initState();
    loadUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.whenOrNull(
              initial: () => const ACLoading(),
              loading: () => shimmerWidget(context),
              done: () => RefreshIndicator(
                onRefresh: () => context.read<HomeCubit>().initial(),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ///page header
                      const AppHeader(
                        textFieldAutoFocus: false,
                        textFieldEnabled: false,
                      ),

                      ///categories
                      idleChips(context),
                      AppSize.s8.heightSizeBox(),

                      ///videos
                      categorySection(
                          context, textLocalization.newContents, HomeCubit.videos.sublist(0)),
                      categorySection(
                          context, textLocalization.trends, HomeCubit.videos.sublist(3)),
                      categorySection(
                          context, textLocalization.topRated, HomeCubit.videos.sublist(6)),
                      categorySection(
                          context, textLocalization.forYou, HomeCubit.videos.sublist(1)),
                    ],
                  ),
                ),
              ),
            ) ??
            const SizedBox();
      },
    );
  }

  categorySection(
          BuildContext context, String title, List<ContentResponseEntity> models) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            AppSize.s8.heightSizeBox(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: models
                    .map(
                      (e) => Row(
                        children: [
                          SizedBox(
                              width: 350,
                              child: RelatedVideoContainer(videoModel: e)),
                          AppSize.s8.widthSizeBox(),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      );

  idleChips(BuildContext context) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: HomeCubit.chips.entries
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: FilterChip(
                      label: Text(e.key),
                      onSelected: (_) {
                        getIt<SearchCubit>().selectChip(e.key);
                        context.go('/search',
                            extra: {'isFromHome': true, 'selectedChip': e.key});
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppHeader(
              textFieldAutoFocus: false,
              textFieldEnabled: false,
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
            Column(
              children: List.generate(
                3,
                (_) => categorySection(
                    context, '', List.generate(10, (_) => ContentResponseEntity())),
              ),
            )
          ],
        ),
      ),
    );
  }
}
