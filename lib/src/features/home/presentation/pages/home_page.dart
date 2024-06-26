import 'package:academy/src/core/widgets/responsive_widget/responsive_widget.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/home/presentation/bloc/home_cubit.dart';
import 'package:academy/src/features/home/presentation/pages/mobile_page/mobile_home_page.dart';
import 'package:academy/src/features/home/presentation/pages/web_page/web_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context){
        final cubit = HomeCubit();
        cubit.initial();
        return cubit;
      },
      child:  const ResponsiveWidget(
        largeScreen: WebHomePage(),
        smallScreen: MobileHomePage(),
      ),
    );
  }
}
