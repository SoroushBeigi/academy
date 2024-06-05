import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({super.key, this.largeScreen, this.mediumScreen, required this.smallScreen});

  final Widget? largeScreen;
  final Widget? mediumScreen;
  final Widget smallScreen;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= 1024) {
          return largeScreen?? smallScreen;
        } else if (constraints.maxWidth >= 768) {
          return mediumScreen ?? largeScreen ?? smallScreen;
        } else {
          return smallScreen;
        }
      },
    );
  }
}
