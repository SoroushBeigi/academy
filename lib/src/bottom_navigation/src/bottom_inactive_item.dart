import 'package:flutter/material.dart';

import 'constant/constant.dart';

class BottomInActiveItem extends StatelessWidget {
  const BottomInActiveItem(this.index,
      {super.key, required this.itemWidget,
        required this.onTap,
        required this.showLabel,
        this.label,
        this.labelStyle});

  /// item index
  final int index;

  /// item widget
  final Widget itemWidget;

  /// String to indicate the label item
  final String? label;

  /// Boolean to show the item label
  final bool showLabel;

  /// Value to indicate the label Style
  final TextStyle? labelStyle;

  /// Function called when an item was tapped
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        color: Colors.transparent,
        child: SizedBox.fromSize(
          size: const Size(kCircleRadius * 2, kCircleRadius * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: kIconSize, width: kIconSize, child: itemWidget),
              if (label != null && showLabel) ...[
                const SizedBox(height: 5.0),
                Text(
                  label!,
                  style: labelStyle ??
                      TextStyle(
                        color: Colors.grey[700],
                        fontSize: 12.0,
                      ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
