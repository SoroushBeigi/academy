import 'package:academy/src/core/widgets/responsive_widget/responsive_widget.dart';
import 'package:academy/src/features/home/presentation/pages/mobile_page/mobile_home_page.dart';
import 'package:academy/src/features/home/presentation/pages/web_page/web_home_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      largeScreen: WebHomePage(),
      smallScreen: MobileHomePage(),
    );
  }
}
