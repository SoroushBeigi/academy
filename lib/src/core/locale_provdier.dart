import 'package:academy/src/core/data/local/shared_pref.dart';
import 'package:academy/src/core/resources/app_constants.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class LocaleProvider extends ChangeNotifier {
  Locale? locale = const Locale('en');
  bool canNotify = true;

  LocaleProvider() {
    initialize();
  }

  @override
  void notifyListeners() {
    if (canNotify) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    canNotify = false;
    super.dispose();
  }

  bool get isFa => locale == const Locale('fa');

  void initialize() {
    if (getIt<Storage>().isFa()) {
      locale = const Locale('fa');
      AppConstants.isFa = true;
    }
  }

  void changeLocale(Locale? newLocale) {
    locale = newLocale ?? const Locale('en');
    getIt<Storage>().setIsFa(newLocale?.languageCode == 'fa');
    AppConstants.isFa = newLocale?.languageCode == 'fa';
    notifyListeners();
  }
}
