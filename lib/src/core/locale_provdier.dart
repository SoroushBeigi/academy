import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier{
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

  ///TODO: write method to load locale from share prefs
  ///if there is not any locale in memory should read device's default locale

  void initialize() {}

  void changeLocale(Locale? newLocale) {
    locale = newLocale ?? const Locale('en');
    notifyListeners();
  }

}