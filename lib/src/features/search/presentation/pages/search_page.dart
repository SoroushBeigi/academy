import 'package:academy/src/core/widgets/responsive_widget/responsive_widget.dart';
import 'package:academy/src/features/search/presentation/pages/search_mobile_page/search_mobile_page.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        smallScreen: SearchMobilePage(),
    );
  }
}
