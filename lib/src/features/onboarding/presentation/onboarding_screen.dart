import 'package:academy/src/core/resources/app_constants.dart';
import 'package:academy/src/features/onboarding/domain/page_data_entity.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final pages = [
   PageData(
      title: "Local news\nstories",
      bgColor: Colors.blue[900]!,
      textColor: Colors.white,
      imagePath: 'assets/onboarding1.jpg'),
   PageData(
      title: "Choose your\ninterests",
      textColor: Colors.white,
      bgColor: Colors.blue[500]!,
      imagePath: 'assets/onboarding2.jpg'),
   PageData(
      title: "Drag and\ndrop to move",
      bgColor: Colors.blue[700]!,
       textColor: Colors.white,
      imagePath: 'assets/onboarding3.jpg'),

];

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ConcentricPageView(
        colors: pages.map((p) => p.bgColor).toList(),
        radius: screenWidth * 0.1,
        // curve: Curves.ease,
        onFinish: () {
          context.go('/auth');
        },
        onChange: (page) {
          if (page == AppConstants.onboardingPagesCount) {
            context.go('/auth');
          }
        },
        nextButtonBuilder: (context) => Padding(
          padding: const EdgeInsets.only(left: 3), // visual center
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: screenWidth * 0.08,
          ),
        ),
        itemBuilder: (index) {
          final page = pages[index % pages.length];
          return SafeArea(
            child: _Page(page: page),
          );
        },
      ),
    );
  }
}

class _Page extends StatelessWidget {
  final PageData page;

  const _Page({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    space(double p) => SizedBox(height: screenHeight * p / 100);
    return Column(
      children: [
        space(10),
        _Image(
          page: page,
          size: 190,
          imagePath: page.imagePath ?? '',
        ),
        space(8),
        _Text(
          page: page,
          style: TextStyle(
            fontSize: screenHeight * 0.046,
          ),
        ),
      ],
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({
    Key? key,
    required this.page,
    this.style,
  }) : super(key: key);

  final PageData page;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      page.title ?? '',
      style: TextStyle(
        color: page.textColor,
        fontWeight: FontWeight.w600,
        fontFamily: 'Helvetica',
        letterSpacing: 0.0,
        fontSize: 18,
        height: 1.2,
      ).merge(style),
      textAlign: TextAlign.center,
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    Key? key,
    required this.page,
    required this.size,
    required this.imagePath,
  }) : super(key: key);

  final PageData page;
  final double size;
  final String imagePath;

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      child: Image.asset(
        imagePath,
        width: size,
        height: size,
        fit: BoxFit.fill,
      ),
    );
  }
}
