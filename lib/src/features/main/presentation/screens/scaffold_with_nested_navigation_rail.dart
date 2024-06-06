import 'package:academy/src/core/extensions/extensions.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNavigationRail extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const ScaffoldWithNestedNavigationRail(
      {super.key,
        required this.navigationShell,
        required this.selectedIndex,
        required this.onDestinationSelected,
      });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: selectedIndex,
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: (IconManager.home)
                      .iconWidget(color: const Color(0xFF6b6d70)),
                  selectedIcon:
                  (IconManager.homeFill).iconWidget(color: Theme.of(context).colorScheme.primary),
                  label: const Text('Home'),
                ),
                NavigationRailDestination(
                  icon: (IconManager.search)
                      .iconWidget(color: const Color(0xFF6b6d70)),
                  selectedIcon:
                  (IconManager.searchFill).iconWidget(color: Theme.of(context).colorScheme.primary),
                  label: const Text('Search'),
                ),
                NavigationRailDestination(
                  icon: (IconManager.add)
                      .iconWidget(color:const Color(0xFF6b6d70)),
                  selectedIcon:
                  (IconManager.addFill).iconWidget(color: Theme.of(context).colorScheme.primary),
                  label: const Text('Add'),
                ),
                NavigationRailDestination(
                  icon: (IconManager.saved)
                      .iconWidget(color:const Color(0xFF6b6d70)),
                  selectedIcon:
                  (IconManager.savedFill).iconWidget(color: Theme.of(context).colorScheme.primary),
                  label: const Text('Saved'),
                ),
                NavigationRailDestination(
                  icon: (IconManager.person)
                      .iconWidget(color: const Color(0xFF6b6d70)),
                  selectedIcon:
                  (IconManager.personFill).iconWidget(color: Theme.of(context).colorScheme.primary),
                  label: const Text('Profile'),
                ),

              ],
              onDestinationSelected: onDestinationSelected,
              labelType: NavigationRailLabelType.all,
            ),
            const VerticalDivider(
              thickness: AppSize.s1,
              width: AppSize.s1,
              color: Color(0xFF6b6d70),
            ),
            Expanded(
              child: navigationShell,
            )
          ],
        ));
  }
}