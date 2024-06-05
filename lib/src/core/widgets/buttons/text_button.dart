import 'package:academy/src/core/resources/resources.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.hasBorder = false,
    this.padding,
    this.fontSize,
    this.fontWeight,
  });

  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final bool hasBorder;
  final Color? borderColor;
  final double? borderWidth;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    // todo set colors with theme
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: hasBorder ? MaterialStateProperty.all<Color>(backgroundColor ?? Colors.transparent) : MaterialStateProperty.all<Color>(backgroundColor ?? Colors.blue),
        foregroundColor: hasBorder ? MaterialStateProperty.all<Color>(backgroundColor ?? Colors.blue) : MaterialStateProperty.all<Color>(backgroundColor ?? Colors.blue),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? AppRadius.r6),
            side: hasBorder ? BorderSide(color: borderColor ?? Colors.blue, width: borderWidth ?? AppSize.s1) : BorderSide.none,
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding ?? const EdgeInsets.all(AppPadding.p12)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Optional: adjust tap area size
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );

  }
}
