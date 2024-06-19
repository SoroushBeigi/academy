import 'package:academy/src/core/extensions/extensions.dart';
import 'package:academy/src/features/search/presentation/cubit/search_cubit.dart';
import 'package:academy/src/features/search/presentation/cubit/search_state.dart';
import 'package:academy/src/features/search/presentation/widgets/search_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:flutter/material.dart';

class SearchWebPage extends StatefulWidget {
  const SearchWebPage({required this.isFromHome,required this.selectedChip, super.key});
  final String? selectedChip;
  final bool? isFromHome;

  @override
  State<SearchWebPage> createState() => _SearchWebPageState();
}

class _SearchWebPageState extends State<SearchWebPage> {
  @override
  Widget build(BuildContext context) {
    final crossCount = (MediaQuery.of(context).size.width ~/ 350).toInt();
    return BlocBuilder<SearchCubit, SearchState>(
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
                        padding: const EdgeInsets.only(top: 90),
                        child: videos.isEmpty
                            ? Center(
                                child: Text(AppLocalizations.of(context)
                                    .noItemsFound),
                              )
                            : GridView.builder(
                                itemCount: videos.length,
                                itemBuilder: (context, index) =>
                                    RelatedVideoContainer(
                                  margin: 8,
                                  videoModel: videos[index],
                                ),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      crossCount == 0 ? 1 : crossCount,
                                  childAspectRatio: 1.2,
                                ),
                              ),
                      ),
                    ) ??
                    const SizedBox(),
                Column(
                  children: [
                    SearchField(enabled: true, autoFocus: widget.isFromHome),
                    AppSize.s8.heightSizeBox(),
                    state.whenOrNull(
                          foundVideos: (_) => idleChips(context),
                          initial: () => idleChips(context),
                          chipsChanged: (chips) => Row(
                              children: chips.entries
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                        ) ??
                        const SizedBox(),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  idleChips(BuildContext context) => Row(
      children: context
          .read<SearchCubit>()
          .chips
          .entries
          .map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: FilterChip(
                label: Text(e.key),
                onSelected: (value) =>
                    context.read<SearchCubit>().switchChips(e.key, value),
                selected: false,
              ),
            ),
          )
          .toList());
}
