import 'package:academy/src/core/widgets/responsive_widget/responsive_widget.dart';
import 'package:academy/src/features/features.dart';
import 'package:academy/src/features/main/presentation/screens/scaffold_with_nested_navigation.dart';
import 'package:academy/src/features/main/presentation/screens/scaffold_with_nested_navigation_rail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MainCubit(),
      child: BlocBuilder<MainCubit, MainState>(
        builder: (BuildContext context, MainState state) {
          return ResponsiveWidget(
            smallScreen: ScaffoldWithNestedNavigation(
              navigationShell: navigationShell,
            ),
            largeScreen: ScaffoldWithNestedNavigationRail(
              navigationShell: navigationShell,
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: (index) {
                context.read<MainCubit>().updateNavigationIndexState(index);
                navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
