import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({super.key, required this.title, required this.onPressed, this.backgroundColor, this.textColor, this.fontSize});
  final String title;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primary
      ),
      onPressed: onPressed,
      child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: textColor, fontSize: fontSize),
      ),);
  }
}
