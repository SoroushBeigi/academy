import 'package:academy/src/core/extensions/widget_extensions.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/features/search/presentation/cubit/search_cubit.dart';
import 'package:academy/src/features/search/presentation/cubit/search_state.dart';
import 'package:academy/src/features/search/presentation/widgets/search_field.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchMobilePage extends StatelessWidget {
  const SearchMobilePage({required this.isFromHome,super.key});
  final bool? isFromHome;

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
                            padding: const EdgeInsets.only(bottom: 100),
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
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          // Reduced border radius
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: SearchField(enabled: true,autoFocus:isFromHome),
                      ),
                      AppSize.s8.heightSizeBox(),
                      state.whenOrNull(
                        foundVideos: (_) => idleChips(context),
                        initial: () => idleChips(context),
                        chipsChanged: (chips) => Wrap(
                            children: chips.entries
                                .map(
                                  (e) => FilterChip(
                                    label: Text(e.key),
                                    onSelected: (value) => context
                                        .read<SearchCubit>()
                                        .switchChips(e.key, value),
                                    selected: chips[e.key] ?? false,
                                  ),
                            )
                                .toList()),
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

  idleChips(BuildContext context) => Wrap(
      children: context
          .read<SearchCubit>()
          .chips
          .entries
          .map(
            (e) => FilterChip(
              label: Text(e.key),
              onSelected: (value) =>
                  context.read<SearchCubit>().switchChips(e.key,value),
              selected: false,
            ),
      )
          .toList());
}
