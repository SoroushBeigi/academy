import 'package:flutter/material.dart';

class BottomBarItem {
  const BottomBarItem({
    required this.inActiveItem,
    required this.activeItem,
    this.itemLabel,
  });

  final Widget inActiveItem;

  final Widget activeItem;

  final String? itemLabel;
}