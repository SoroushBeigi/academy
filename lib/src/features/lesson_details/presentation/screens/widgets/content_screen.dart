import 'package:academy/src/core/extensions/extensions.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/features/lesson_details/presentation/screens/widgets/stepper.dart';
import 'package:flutter/material.dart';
import 'package:academy/src/core/widgets/widgets_export.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen(
      {super.key,
      required this.countStepper,
      required this.activeStepper,
      required this.onPressed,
        required this.opacity,
      required this.color});

  final int countStepper;
  final int activeStepper;
  final Color color;
  final VoidCallback onPressed;
  final bool opacity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          StepperWidget(
            countStepper: countStepper,
            activeStepper: activeStepper,
            widget: Column(
              children: [
                Container(
                  color: color,
                  height: 500,
                ),
                (AppSize.s16).heightSizeBox(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButtonWidget(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    textColor: Theme.of(context).colorScheme.onPrimary,
                    title: 'Next',
                    onPressed:
                      onPressed,
                  ),
                ),
              ],
            ),
          )
        ],
      ).paddingSymmetric(horizontal: AppPadding.p8),
    );
  }
}
