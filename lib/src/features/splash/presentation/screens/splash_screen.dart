import 'package:academy/src/di/di_setup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../features.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SplashCubit>(),
      child: const _SplashScreen(),
    );
  }
}

class _SplashScreen extends StatefulWidget {
  const _SplashScreen();

  @override
  State<_SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<_SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        final cubit = getIt<SplashCubit>();
        if (cubit.getLoggedIn()) {
          context.go('/main');
        } else {
          if (kIsWeb) {
            context.go('/auth');
          } else {
            context.go('/onboarding');
          }
        }
        // if (cubit.getLoggedIn()) {
        //   if (cubit.loggedIn) {
        //     context.go('/main');
        //   } else {
        //     context.go('/auth');
        //   }
        // } else {
        //   if(kIsWeb){
        //     if (cubit.loggedIn) {
        //       context.go('/main');
        //     } else {
        //       context.go('/auth');
        //     }
        //   }else {
        //     cubit.setOnboarded();
        //     context.go('/onboarding');
        //   }
        // }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
