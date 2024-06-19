import 'package:academy/src/core/widgets/responsive_widget/responsive_widget.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/search/presentation/cubit/search_cubit.dart';
import 'package:academy/src/features/search/presentation/pages/search_mobile_page/search_mobile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_web_page/search_web_page.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({this.extra, super.key});

  final Map<String, dynamic>? extra;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = getIt<SearchCubit>();
        if(extra?['selectedChip']!=null){
          cubit.selectChip(extra?['selectedChip']);
        }
        return cubit;
        },
      child: ResponsiveWidget(
        smallScreen: SearchMobilePage(
          isFromHome: extra?['isFromHome'] ?? false,
          selectedChip: extra?['selectedChip'],
        ),
        largeScreen: SearchWebPage(
          isFromHome: extra?['isFromHome'] ?? false,
          selectedChip: extra?['selectedChip'],
        ),
      ),
    );
  }
}
