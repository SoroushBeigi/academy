import 'package:academy/src/core/extensions/widget_extensions.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/features/home/home.dart';
import 'package:academy/src/features/search/presentation/cubit/search_cubit.dart';
import 'package:academy/src/features/search/presentation/cubit/search_state.dart';
import 'package:academy/src/features/search/presentation/widgets/search_field.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchMobilePage extends StatelessWidget {
  const SearchMobilePage({required this.isFromHome,required this.selectedChip, super.key});

  final bool? isFromHome;
  final String? selectedChip;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Stack(
                children: [
                  state.whenOrNull(
                        initial: () => SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: Center(
                            child: Text(
                                AppLocalizations.of(context).startSearching),
                          ),
                        ),
                        foundVideos: (videos) => Padding(
                          padding: const EdgeInsets.only(top: 56),
                          child: videos.isEmpty
                              ? Center(
                                  child: Text(AppLocalizations.of(context)
                                      .noItemsFound),
                                )
                              : ListView.builder(
                                  padding: const EdgeInsets.only(bottom: 100,top:100),
                                  shrinkWrap: true,
                                  itemCount: videos.length,
                                  itemBuilder: (context, index) =>
                                      RelatedVideoContainer(
                                    margin: 8,
                                    videoModel: videos[index],
                                  ),
                                ),
                        ),
                      ) ??
                      const SizedBox(),
                  Column(
                    children: [
                      SearchField(enabled: true, autoFocus: isFromHome),
                      AppSize.s8.heightSizeBox(),
                      state.whenOrNull(
                        foundVideos: (_) => activeChips(context,context.read<SearchCubit>().chips),
                        initial: () => idleChips(context),
                        chipsChanged: (chips) => activeChips(context,chips),
                      ) ??
                          const SizedBox(),
                    ],
                  ),
                ],
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

  activeChips(BuildContext context,Map<String,bool> chips) => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
        children: chips.entries
            .map(
              (e) => Container(
                margin: const EdgeInsets.only(bottom: 2),
            padding: const EdgeInsets.symmetric(
                horizontal: 2),
            child: FilterChip(
              label: Text(e.key),
              onSelected: (value) => context
                  .read<SearchCubit>()
                  .switchChips(e.key, value),
              selected: chips[e.key] ?? false,
            ),
          ),
        )
            .toList()),
  );
}
