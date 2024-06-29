import 'package:academy/src/core/resources/value_manager.dart';
import 'package:academy/src/features/favourite/presentation/cubit/favourite_cubit.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavouriteMobilePage extends StatelessWidget {
  const FavouriteMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).saved),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: context.read<FavouriteCubit>().savedContentList.isEmpty
            ? Center(
                child: Text(AppLocalizations.of(context).noSavedItems),
              )
            : ListView.builder(
                itemCount:
                    context.read<FavouriteCubit>().savedContentList.length,
                itemBuilder: (context, index) {
                  final videoModel =
                      context.read<FavouriteCubit>().savedContentList[index];
                  if (videoModel.id == -1) {
                    return const SizedBox();
                  } else {
                    return RelatedVideoContainer(
                      margin: 8,
                      videoModel: videoModel,
                    );
                  }
                },
              ),
      ),
    );
  }
}
