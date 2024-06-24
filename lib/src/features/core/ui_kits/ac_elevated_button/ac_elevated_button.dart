import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ACElevatedButton extends StatelessWidget {
  const ACElevatedButton({
    super.key,
    this.title,
    this.onTap,
    this.backgroundColor,
    this.buttonPadding,
    this.titleColor,
    this.showLoading,
    this.width,
    this.height,
    this.elevation,
    this.underline = false,
    this.borderRadius = 8,
    this.style,
    this.child,
  });

  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? titleColor;
  final String? title;
  final bool? showLoading;
  final bool? underline;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? elevation;
  final double? buttonPadding;
  final TextStyle? style;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? double.maxFinite,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation:
          elevation == null ? null : WidgetStateProperty.all(elevation),
          shadowColor: WidgetStateColor.resolveWith((states) =>
          backgroundColor ?? Theme.of(context).colorScheme.primary),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 0),
            ),
          ),
          backgroundColor: WidgetStateColor.resolveWith((states) =>
          backgroundColor ?? Theme.of(context).colorScheme.primary),
        ),
        onPressed: onTap,
        child: Padding(
          padding: EdgeInsets.all(buttonPadding ?? 0.0),
          child: showLoading ?? false
              ? Center(
              child: SpinKitThreeBounce(
                color: Theme.of(context).colorScheme.surface,
                size: 30,
              ))
              : Center(
            child: child ??
                FittedBox(
                  child: Text(
                    title ?? '',
                    textAlign: TextAlign.center,
                    style: style ??
                        Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: titleColor),
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
