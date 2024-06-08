import 'package:academy/src/core/locale_provdier.dart';
import 'package:academy/src/core/widgets/change_theme_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = context.read<LocaleProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).profileSettings),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 60,
              margin: const EdgeInsets.all(4),
              child:  Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context).appTheme),
                      const ChangeThemeIcon(),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(4),
              height: 60,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(AppLocalizations.of(context).appLanguage,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: GestureDetector(
                          onTap: () {
                            if (localeProvider.locale == const Locale('en')) {
                              localeProvider.changeLocale(const Locale('fa'));
                            } else {
                              localeProvider.changeLocale(const Locale('en'));
                            }
                          },
                          child: Text(
                              AppLocalizations.of(context).currentLanguage,textAlign: TextAlign.center,),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
