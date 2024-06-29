import 'package:academy/src/core/resources/resources.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final VoidCallback onTap;

  const CircularButton({
    Key? key,
    required this.icon,
    this.backgroundColor,
    this.iconColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p12),
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).colorScheme.onSurface,
          borderRadius: BorderRadius.circular(AppSize.s48),
        ),
        child: Icon(
          icon,
          color: iconColor ?? Theme.of(context).colorScheme.surface,
        ),
      ),
    );
  }
}