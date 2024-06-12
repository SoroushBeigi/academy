import 'package:academy/src/bottom_navigation/bottom_navigation.dart';
import 'package:academy/src/core/extensions/extensions.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/features/main/presentation/bloc/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class ScaffoldWithNestedNavigation extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNestedNavigation(
      {super.key, required this.navigationShell});

  @override
  State<ScaffoldWithNestedNavigation> createState() =>
      _ScaffoldWithNestedNavigationState();
}

class _ScaffoldWithNestedNavigationState
    extends State<ScaffoldWithNestedNavigation> {

  void _goBranch(int index) {
    // setState(() {});
    context.read<MainCubit>().updateNavigationIndexState(index);
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    //todo set color with theme
    final primary = Theme.of(context).colorScheme.primary;
    final onSurface = Theme.of(context).colorScheme.onSurfaceVariant;
    return SafeArea(
      child: Scaffold(
        // key: MainCubit.scaffoldKey,
        body: widget.navigationShell,
        resizeToAvoidBottomInset: false,
        extendBody: true,
        bottomNavigationBar: AnimatedBottomBar(
          color: Theme.of(context).colorScheme.surface,
          notchColor: Theme.of(context).colorScheme.surface,
          bottomController: context.read<MainCubit>().controller,
          showLabel: false,
          removeMargins: false,
          bottomBarWidth: 500,
          durationInMilliSeconds: 300,
          bottomBarItems: [
            BottomBarItem(
              inActiveItem:
              (IconManager.home).iconWidget(color: onSurface),
              activeItem:
              (IconManager.homeFill).iconWidget(color: primary),
              itemLabel: AppLocalizations.of(context).home,
            ),
            BottomBarItem(
              inActiveItem:
              (IconManager.search).iconWidget(color: onSurface),
              activeItem:
              (IconManager.searchFill).iconWidget(color: primary),
              itemLabel: AppLocalizations.of(context).search,
            ),
            BottomBarItem(
              inActiveItem:
              (IconManager.add).iconWidget(color: onSurface),
              activeItem:
              (IconManager.addFill).iconWidget(color: primary),
              itemLabel: AppLocalizations.of(context).add,
            ),
            BottomBarItem(
              inActiveItem:
              (IconManager.saved).iconWidget(color: onSurface),
              activeItem:
              (IconManager.savedFill).iconWidget(color: primary),
              itemLabel: AppLocalizations.of(context).saved,
            ),
            BottomBarItem(
              inActiveItem:
              (IconManager.person).iconWidget(color: onSurface),
              activeItem:
              (IconManager.personFill).iconWidget(color: primary),
              itemLabel: AppLocalizations.of(context).profile,
            ),
          ],
          onTap: _goBranch,
        ),
      ),
    );
  }
}