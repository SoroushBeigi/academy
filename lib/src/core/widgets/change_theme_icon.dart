import 'package:academy/src/core/resources/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeThemeIcon extends StatelessWidget {
  const ChangeThemeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.of<ThemeBloc>(context);
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return IconButton(
          icon: Icon(
              state is DarkThemeState?Icons.sunny : Icons.nightlight_round),
          onPressed: () {
            if (themeBloc.isDark) {
              themeBloc.add(SwitchToLightEvent());
            } else {
              themeBloc.add(SwitchToDarkEvent());
            }
          },
        );
      },
    );
  }
}
