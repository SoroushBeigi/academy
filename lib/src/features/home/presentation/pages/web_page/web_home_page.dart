import 'package:academy/src/core/extensions/widget_extensions.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/core/core.dart';
import 'package:academy/src/features/home/presentation/bloc/home_state.dart';
import 'package:academy/src/features/search/presentation/cubit/search_cubit.dart';
import 'package:academy/src/features/search/presentation/widgets/search_field.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:academy/content_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../main/presentation/bloc/main_cubit.dart';
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
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.whenOrNull(
              initial: () => const ACLoading(),
              loading: () => const ACLoading(),
              done: () => RefreshIndicator(
                onRefresh: () => context.read<HomeCubit>().initial(),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///page header
                      Row(
                        children: [
                          ///logo
                          SizedBox(
                            height: 50,
                            child: Row(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.asset(
                                      'assets/icon.png',
                                    )),
                                // AppSize.s4.widthSizeBox(),
                                Text(
                                  AppLocalizations.of(context).academy,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),

                          ///search
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 16),
                              child: GestureDetector(
                                onTap: () {
                                  context.go('/search',extra: {'isFromHome':true,'selectedChip': null});
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
                          ),

                          ///user
                          InkWell(
                            onTap: () {
                              context.go('/profile', extra: true);
                              context
                                  .read<MainCubit>()
                                  .updateNavigationIndexState(4);
                            },
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  Stack(
                                    children: [
                                      const Icon(
                                        Icons.notifications,
                                        size: AppSize.s28,
                                      ),
                                      Container(
                                        width: AppSize.s16,
                                        height: AppSize.s16,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                AppSize.s60),
                                            color: Colors.red),
                                        child: const Center(
                                            child: Text('2',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 8))),
                                      )
                                    ],
                                  ),
                                  AppSize.s8.widthSizeBox(),
                                  VerticalDivider(
                                    thickness: AppSize.s1,
                                    width: AppSize.s1,
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                  AppSize.s8.widthSizeBox(),
                                  Container(
                                    width: AppSize.s42,
                                    height: AppSize.s42,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(AppSize.s60),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondaryContainer),
                                    child: const Center(
                                      child: Icon(
                                        Icons.person,
                                      ),
                                    ),
                                  ),
                                  AppSize.s8.widthSizeBox(),
                                  Text(
                                    username,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                  ),
                                  AppSize.s16.widthSizeBox(),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),

                      ///categories
                      idleChips(context),

                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Row(
                      //     children: List.generate(
                      //       7,
                      //       (index) => GestureDetector(
                      //         onTap: () {
                      //           VideoDetailsCubit.url = videoModels[index].url!;
                      //           context.pushNamed('videoDetails',
                      //               extra: videoModels[index]);
                      //         },
                      //         child: Container(
                      //             padding: const EdgeInsets.all(12),
                      //             margin:
                      //                 const EdgeInsets.symmetric(horizontal: 8),
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

                      // child: GridView.builder(
                      //   itemCount: HomeCubit.videos.length,
                      //   itemBuilder: (context, index) => RelatedVideoContainer(
                      //     margin: 8,
                      //     videoModel: HomeCubit.videos[index],
                      //   ),
                      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount: crossCount == 0 ? 1 : crossCount,
                      //     childAspectRatio: 1,
                      //   ),
                      // ),

                      categorySection(
                          context, 'Live', HomeCubit.videos.sublist(0)),
                      categorySection(
                          context, 'Education', HomeCubit.videos.sublist(0, 5)),
                      categorySection(context, 'Entertainment',
                          HomeCubit.videos.sublist(2, 4)),
                      categorySection(context, 'Music',
                          HomeCubit.videos.sublist(1, HomeCubit.videos.length)),
                      categorySection(
                          context, 'Nature', HomeCubit.videos.sublist(2, 5)),
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
          BuildContext context, String title, List<ContentEntity> models) =>
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

  idleChips(BuildContext context) => Row(
      children: context
          .read<HomeCubit>()
          .chips
          .entries
          .map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: FilterChip(
                label: Text(e.key),
                onSelected: (_) {
                  getIt<SearchCubit>().selectChip(e.key);
                  context.go('/search', extra: {'isFromHome':true,'selectedChip': e.key});
                },
                selected: false,
              ),
            ),
          )
          .toList());
}
