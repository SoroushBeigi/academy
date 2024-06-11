import 'package:academy/src/core/locale_provdier.dart';
import 'package:academy/src/core/resources/theme/custom_theme.dart';
import 'package:academy/src/core/resources/theme/theme_bloc.dart';
import 'package:academy/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocaleProvider(),
      child: BlocProvider(
        create: (context) => ThemeBloc(),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            final provider = context.watch<LocaleProvider>();
            return MaterialApp.router(
              theme: CustomTheme.lightThemeData(),
              darkTheme: CustomTheme.darkThemeData(),
              themeMode: context.watch<ThemeBloc>().isDark? ThemeMode.dark : ThemeMode.light,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: provider.locale,
              routerConfig: Routes.routes,
            );
          },
        ),
      ),
    );
  }
}
