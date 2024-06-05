import 'package:academy/src/core/widgets/change_theme_icon.dart';
import 'package:academy/src/features/learning/presentation/widgets/learning_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const ChangeThemeIcon()),
      body: SingleChildScrollView(
        child: Column(
          children: List<Widget>.generate(
                20,
                (index) => Animate(
                  effects: [
                    MoveEffect(
                      //TODO: create a function to calculate delay value (500 here). longer lists need shorter delays
                      duration: 500.milliseconds,
                      delay: (500 * index).milliseconds,
                      curve: Curves.ease,
                      begin: Offset(-100.w, 0),
                      end: const Offset(0, 0),
                    )
                  ],

                  child: LearningItem(
                    title: 'Course $index',
                  ),
                ),
              ) +
              [
                SizedBox(
                  height: 20.h,
                )
              ],
        ),
      ),
    );
  }
}
