import 'package:academy/src/core/logic/keyboard/full_screen_keyboard_listener.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'circle_icon_button.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({
    super.key,
    this.icon = IconManager.previous,
    this.onPressed,
    this.semanticLabel,
    this.bgColor,
    this.iconColor,
  });

  final Color? bgColor;
  final Color? iconColor;
  final IconData icon;
  final VoidCallback? onPressed;
  final String? semanticLabel;

  const BackBtn.close({Key? key, VoidCallback? onPressed, Color? bgColor, Color? iconColor})
      : this(
      key: key,
      icon: IconManager.close,
      onPressed: onPressed,
      semanticLabel: 'close',
      bgColor: bgColor,
      iconColor: iconColor);

  bool _handleKeyDown(BuildContext context, KeyDownEvent event) {
    if (event.logicalKey == LogicalKeyboardKey.escape) {
      _handleOnPressed(context);
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return FullScreenKeyboardListener(
      onKeyDown: (event) => _handleKeyDown(context, event),
      child: CircleIconButton(
        icon: icon,
        bgColor: bgColor,
        color: iconColor,
        onPressed: onPressed ??
                () {
              final nav = Navigator.of(context);
              if (nav.canPop()) {
                Navigator.pop(context);
              } else {
                // context.go(ScreenPaths.home);
              }
            },
        semanticLabel: semanticLabel ?? 'back',
      ),
    );
  }

  Widget safe() => _SafeAreaWithPadding(child: this);

  void _handleOnPressed(BuildContext context) {
    if (onPressed != null) {
      onPressed?.call();
    } else {
      if (context.canPop()) {
        context.pop();
      } else {
        // context.go(ScreenPaths.home);
      }
    }
  }
}

class _SafeAreaWithPadding extends StatelessWidget {
  const _SafeAreaWithPadding({required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.all(AppStyle().insets.sm),
        child: child,
      ),
    );
  }
}