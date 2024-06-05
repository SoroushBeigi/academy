import 'package:academy/src/core/extensions/extensions.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:flutter/material.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget(
      {super.key,
      required this.countStepper,
      required this.activeStepper,
      required this.widget});

  final int countStepper;
  final int activeStepper;
  final Widget widget;

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {

  bool s = false;
  Future delay() async{
    await Future.delayed(AppTimes().t600);
    s = true;
    return 1.0;
  }
  @override
  Widget build(BuildContext context) {
    List<bool> stepperList = List.generate(widget.countStepper, (index) => index < widget.activeStepper);
    return FutureBuilder(
      future: delay(),
      builder: (context, snapshot) {
         if(snapshot.hasData) {
           return ListView(
             shrinkWrap: true,
             physics: const BouncingScrollPhysics(),
             children: [
               SizedBox(
                 width: double.infinity,
                 height: AppSize.s8,
                 child: Row(
                   children: List.generate(
                     widget.countStepper,
                         (index) => Expanded(
                         child: AnimatedOpacity(
                           opacity: 1,
                           duration: AppTimes().t600,
                           child: Container(
                             decoration: BoxDecoration(
                                 color: Theme.of(context).colorScheme.primary,
                                 borderRadius: BorderRadius.circular(AppRadius.r8)),
                           ).paddingSymmetric(horizontal: AppPadding.p2),
                         )
                     ),
                   ),
                 ),
               ),
               (AppSize.s12).heightSizeBox(),
               widget.widget.paddingOnly(bottom: AppPadding.p16),
               ElevatedButton(onPressed: () {}, child: const Text('Next'))
             ],
           );
         }
        return ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              width: double.infinity,
              height: AppSize.s8,
              child: Row(
                children: List.generate(
                  widget.countStepper,
                      (index) => Expanded(
                    child: AnimatedOpacity(
                      opacity: stepperList[index] ? 1 : 0.2,
                      duration: AppTimes().t600,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(AppRadius.r8)),
                      ).paddingSymmetric(horizontal: AppPadding.p2),
                    )
                      ),
                ),
              ),
            ),
            (AppSize.s12).heightSizeBox(),
            widget.widget.paddingOnly(bottom: AppPadding.p16),
            ElevatedButton(onPressed: () {}, child: const Text('Next'))
          ],
        );
      }
    );
  }
}
