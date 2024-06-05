import 'package:flutter/material.dart';

import 'constant/constant.dart';

class BottomBarActiveItem extends StatelessWidget {
  const BottomBarActiveItem(
    this.index, {super.key, 
    required this.itemWidget,
    required this.onTap,
    required this.scrollPosition,
  });
  final int index;
  final Widget itemWidget;
  final double scrollPosition;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final icon = itemWidget;
    return GestureDetector(
      child: SizedBox.fromSize(
        size: const Size(kIconSize, kIconSize),
        child: Opacity(
            opacity: kPi * 2 * (scrollPosition % 1) == 0 ? 1 : 0, child: icon),
      ),
      onTap: () => onTap(index),
    );
  }
}
