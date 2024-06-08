import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/add/presentation/cubit/add_cubit.dart';
import 'package:academy/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<AuthCubit>();
    return BlocProvider(
      create: (context) {
        return AddCubit();
      },
      child: FlutterLogin(
        onLogin: (p0) {
          cubit.setLoggedIn();
          context.go('/main');
        },
        onRecoverPassword: (p0) => null,
        onSignup: (p0) {
          cubit.setLoggedIn();
          context.go('/main');
        },
      ),
    );
  }
}
