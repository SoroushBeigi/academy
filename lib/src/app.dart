import 'package:academy/src/core/resources/theme/custom_theme.dart';
import 'package:academy/src/core/resources/theme/theme_bloc.dart';
import 'package:academy/src/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: CustomTheme.lightThemeData(),
            darkTheme: CustomTheme.darkThemeData(),
            themeMode: state is DarkThemeState ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: kDebugMode,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: const Locale("en", "US"),
            routerConfig: Routes.routes,
          );
        },
      ),
    );
  }
}
