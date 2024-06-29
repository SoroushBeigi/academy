import 'package:academy/src/core/extensions/extensions.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/home/home.dart';
import 'package:academy/src/features/search/presentation/cubit/search_cubit.dart';
import 'package:academy/src/features/search/presentation/cubit/search_state.dart';
import 'package:academy/src/features/search/presentation/widgets/search_field.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/ui_kits/ui_kits.dart';

class SearchMobilePage extends StatefulWidget {
  const SearchMobilePage(
      {required this.isFromHome, required this.selectedChip, super.key});

  final bool? isFromHome;
  final String? selectedChip;

  @override
  State<SearchMobilePage> createState() => _SearchMobilePageState();
}

class _SearchMobilePageState extends State<SearchMobilePage> {
  @override
  void initState() {
    if (HomeCubit.chips.entries.isEmpty) {
      context.read<SearchCubit>().initialLoad();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        if (widget.isFromHome == true && widget.selectedChip != null) {
          return getIt<SearchCubit>()..selectChip(widget.selectedChip!);
        } else {
          return getIt<SearchCubit>();
        }
      },
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SearchField(enabled: true, autoFocus: widget.isFromHome),
                    AppSize.s8.heightSizeBox(),
                    state.whenOrNull(
                          foundVideos: (_) =>
                              activeChips(context, HomeCubit.chips),
                          initial: () => activeChips(context, HomeCubit.chips),
                          chipsChanged: (chips) => activeChips(context, chips),
                        ) ??
                        const SizedBox(),
                    state.whenOrNull(
                          loading: () => const ACLoading(),
                          initial: () => SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: Center(
                              child: Text(
                                  AppLocalizations.of(context).startSearching),
                            ),
                          ),
                          foundVideos: (videos) => videos.isEmpty
                              ? SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: Center(
                                    child: Text(AppLocalizations.of(context)
                                        .noItemsFound),
                                  ),
                                )
                              : ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.only(bottom: 100),
                                  shrinkWrap: true,
                                  itemCount: videos.length,
                                  itemBuilder: (context, index) => Container(
                                    margin: const EdgeInsets.all(8),
                                    child: RelatedVideoContainer(
                                      videoModel: videos[index],
                                    ),
                                  ),
                                ),
                        ) ??
                        const SizedBox(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

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
                      onSelected: (value) =>
                          context.read<SearchCubit>().switchChips(e.key, value),
                      selected: false,
                    ),
                  ),
                )
                .toList()),
      );

  activeChips(BuildContext context, Map<String, bool> chips) =>
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: chips.entries
                .map(
                  (e) => Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: FilterChip(
                      label: Text(e.key),
                      onSelected: (value) =>
                          context.read<SearchCubit>().switchChips(e.key, value),
                      selected: chips[e.key] ?? false,
                    ),
                  ),
                )
                .toList()),
      );
}
