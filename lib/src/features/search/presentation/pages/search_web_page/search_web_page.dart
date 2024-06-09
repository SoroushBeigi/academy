import 'package:academy/src/features/search/presentation/cubit/search_cubit.dart';
import 'package:academy/src/features/search/presentation/cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:flutter/material.dart';

class SearchWebPage extends StatelessWidget {
  const SearchWebPage({super.key});

  @override
  Widget build(BuildContext context) {
    final crossCount = (MediaQuery.of(context).size.width ~/ 350).toInt();
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
                        child:
                        Text(AppLocalizations.of(context).startSearching),
                      ),
                    ),
                    foundVideos: (videos) => Padding(
                      padding: const EdgeInsets.only(top: 56),
                      child: videos.isEmpty
                          ? Center(
                        child: Text(AppLocalizations.of(context)
                            .noItemsFound),
                      )
                          : GridView.builder(
                        itemCount: videos.length,
                        itemBuilder: (context, index) =>
                            RelatedVideoContainer(
                              videoModel: videos[index],
                            ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossCount == 0 ? 1 : crossCount,
                          childAspectRatio: 1.2,
                        ),
                      ),
                    ),
                  ) ??
                      const SizedBox(),
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
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context).startSearching,
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon:
                        const Icon(Icons.search, color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20.0),
                      ),
                      onChanged: (value) =>
                          context.read<SearchCubit>().search(value),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
