import 'package:academy/src/features/add/presentation/cubit/add_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return AddCubit();
      },
      child: FlutterLogin(
        onLogin: (p0) {context.go('/main');},
        onRecoverPassword: (p0) => null,
        onSignup: (p0) {},
      ),
    );
  }
}
