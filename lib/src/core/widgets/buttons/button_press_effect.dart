import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ButtonPressEffect extends StatefulWidget {
  const ButtonPressEffect(this.child, {super.key});
  final Widget child;

  @override
  State<ButtonPressEffect> createState() => _ButtonPressEffectState();
}

class _ButtonPressEffectState extends State<ButtonPressEffect> {
  final _isDown = BehaviorSubject<bool>.seeded(false);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      excludeFromSemantics: true,
      onTapDown: (_) => _isDown.add(true),
      onTapUp: (_) => _isDown.add(false), // not called, TextButton swallows this.
      onTapCancel: () => _isDown.add(false),
      behavior: HitTestBehavior.translucent,
      child: StreamBuilder<bool>(
          stream: _isDown,
          builder: (context, snapshot) {
            final isDown = snapshot.data?? false;
            return Opacity(
              opacity: isDown ? 0.7 : 1,
              child: ExcludeSemantics(child: widget.child),
            );
          }
      ),
    );
  }
}