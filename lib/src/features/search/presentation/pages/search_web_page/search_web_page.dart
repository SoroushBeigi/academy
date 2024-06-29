import 'package:academy/src/core/widgets/app_header.dart';
import 'package:academy/src/features/core/core.dart';
import 'package:academy/src/features/home/home.dart';
import 'package:academy/src/features/search/presentation/cubit/search_cubit.dart';
import 'package:academy/src/features/search/presentation/cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:flutter/material.dart';

class SearchWebPage extends StatefulWidget {
  const SearchWebPage(
      {required this.isFromHome, required this.selectedChip, super.key});

  final String? selectedChip;
  final bool? isFromHome;

  @override
  State<SearchWebPage> createState() => _SearchWebPageState();
}

class _SearchWebPageState extends State<SearchWebPage> {
  @override
  void initState() {
    if(HomeCubit.chips.entries.isEmpty){
      context.read<SearchCubit>().initialLoad();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              state.whenOrNull(
                loading: () => const ACLoading(),
                    initial: () => SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child:
                            Text(AppLocalizations.of(context).startSearching),
                      ),
                    ),
                    foundVideos: (videos) => Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.15),
                        child: videos.isEmpty
                            ? Center(
                                child: Text(
                                    AppLocalizations.of(context).noItemsFound),
                              )
                            : SingleChildScrollView(
                              child: Wrap(
                                  children: videos
                                      .map(
                                        (e) => Container(
                                          margin: const EdgeInsets.all(8),
                                          width: 350,
                                          child: RelatedVideoContainer(
                                            videoModel: e,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                            )),
                  ) ??
                  const SizedBox(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppHeader(
                      textFieldEnabled: true,
                      textFieldAutoFocus: widget.isFromHome ?? false),
                  state.whenOrNull(
                        foundVideos: (_) => activeChips(context,HomeCubit.chips),
                        initial: () => activeChips(context,HomeCubit.chips),
                        chipsChanged: (chips) => activeChips(context,chips),
                      ) ??
                      const SizedBox(),
                ],
              )
            ],
          ),
        );
      },
    );
  }

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: chips.entries
            .map(
              (e) => Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8.0),
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
