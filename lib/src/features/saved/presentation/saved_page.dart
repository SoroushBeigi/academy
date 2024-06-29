import 'package:academy/src/core/widgets/responsive_widget/responsive_widget.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/core/core.dart';
import 'package:academy/src/features/saved/saved.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {



  @override
  void initState() {
    SavedCubit.selectedIndex.addListener(() {
      _updateRebuildNotifier();
    });
    super.initState();
  }

  @override
  void dispose() {
    SavedCubit.selectedIndex.removeListener(_updateRebuildNotifier);
    SavedCubit.rebuildNotifier.dispose();
    super.dispose();
  }

  void _updateRebuildNotifier() {
    if (SavedCubit.selectedIndex.value == 3) {
      SavedCubit.rebuildNotifier.value = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SavedCubit>()..getSaveContent(),
      child: ValueListenableBuilder(
        valueListenable: SavedCubit.rebuildNotifier,

        builder: (BuildContext context, bool value, Widget? child) {
          if (value) {
            context.read<SavedCubit>().getSaveContent();
            SavedCubit.rebuildNotifier.value = false;
          }
          return BlocBuilder<SavedCubit, SavedState>(
            builder: (context, state) {
              return state.whenOrNull(
                  loading: () => const ACLoading(),
                  success: () => const ResponsiveWidget(
                    largeScreen: SavedWebPage(),
                    smallScreen: SavedMobilePage(),
                  )
              ) ?? const SizedBox();
            },
          );
        },
      ),
    );
  }
}

