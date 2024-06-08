import 'package:academy/src/core/widgets/responsive_widget/responsive_widget.dart';
import 'package:academy/src/features/favourite/presentation/pages/web/favourite_web_page.dart';
import 'package:flutter/material.dart';

import 'pages/mobile/favourite_mobile_page.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      largeScreen: FavouriteWebPage(),
      smallScreen: FavouriteMobilePage(),
    );
  }
}
