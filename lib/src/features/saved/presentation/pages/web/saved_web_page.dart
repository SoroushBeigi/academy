import 'package:academy/src/core/resources/value_manager.dart';
import 'package:academy/src/features/saved/saved.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedWebPage extends StatelessWidget {
  const SavedWebPage({super.key});

  @override
  Widget build(BuildContext context) {
    final crossCount = (MediaQuery.of(context).size.width ~/ 350).toInt();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).saved),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: context.read<SavedCubit>().savedContentList.isEmpty
            ? Center(
                child: Text(AppLocalizations.of(context).noSavedItems),
              )
            : GridView.builder(
                itemCount: context.read<SavedCubit>().savedContentList.length,
                itemBuilder: (context, index) {
                  final videoModel =
                      context.read<SavedCubit>().savedContentList[index];
                  if (videoModel.id == -1) {
                    return const SizedBox();
                  } else {
                    return RelatedVideoContainer(
                      margin: 8,
                      videoModel: videoModel,
                    );
                  }
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossCount == 0 ? 1 : crossCount,
                  childAspectRatio: 1.2,
                ),
              ),
      ),
    );
  }
}
