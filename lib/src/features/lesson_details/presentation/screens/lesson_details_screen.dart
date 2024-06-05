import 'package:academy/src/features/lesson_details/presentation/screens/widgets/stepper.dart';
import 'package:flutter/material.dart';

class LessonDetails extends StatefulWidget {
  const LessonDetails({super.key});

  @override
  State<LessonDetails> createState() => _LessonDetailsState();
}

class _LessonDetailsState extends State<LessonDetails> {
  final _pageController = PageController(initialPage: 0);

  // void _handleButtonPressed(int currentIndex) {
  //   final nextPageIndex =
  //       currentIndex < _pages.length - 1 ? currentIndex + 1 : 0;
  //   _pageController.animateToPage(
  //     nextPageIndex,
  //     duration: AppTimes().t600,
  //     curve: Curves.easeIn,
  //   );
  // }
  //
  // late List<Widget> _pages;
  //
  // void checkOpacity(int activeStepper) {
  //   switch (activeStepper) {
  //     case -1 :
  //   }
  // }
  //
  // @override
  // void initState() {
  //   _pages = [
  //     ContentScreen(
  //         countStepper: 4,
  //         activeStepper: -1,
  //         color: Colors.red,
  //         onPressed: () => _handleButtonPressed(0), opacity: null,),
  //     ContentScreen(
  //       countStepper: 4,
  //       activeStepper: 0,
  //       color: Colors.blue,
  //       onPressed: () => _handleButtonPressed(1), opacity: null,
  //     ),
  //     ContentScreen(
  //       countStepper: 4,
  //       activeStepper: 1,
  //       color: Colors.yellow,
  //       onPressed: () => _handleButtonPressed(2), opacity: null,
  //     ),
  //     ContentScreen(
  //       countStepper: 4,
  //       activeStepper: 2,
  //       color: Colors.green,
  //       onPressed: () => _handleButtonPressed(3), opacity: null,
  //     ),
  //   ];
  //   super.initState();
  // }

  final List<Widget> _pages = [
    const StepperWidget(
        countStepper: 4,
        activeStepper: 0,
        widget: SizedBox(
          width: double.infinity,
          height: 300,
        )),
    const StepperWidget(
        countStepper: 4,
        activeStepper: 1,
        widget: SizedBox(
          width: double.infinity,
          height: 300,
        )),
    const StepperWidget(
        countStepper: 4,
        activeStepper: 2,
        widget: SizedBox(
          width: double.infinity,
          height: 300,
        )),
    const StepperWidget(
        countStepper: 4,
        activeStepper: 3,
        widget: SizedBox(
          width: double.infinity,
          height: 300,
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: PageView(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            children: List.generate(_pages.length, (index) => _pages[index])),
      ),
    );
  }
}
