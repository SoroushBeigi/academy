import 'package:academy/src/core/resources/app_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class Storage {
  static SharedPreferences? _sharedPrefs;

  Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  String? getToken() {
    return _sharedPrefs?.getString(AppConstants.tokenKey);
  }

  Future<void> setToken(String value) async {
    _sharedPrefs?.setString(AppConstants.tokenKey, value);
  }

  bool getSeenOnboarding() {
    return _sharedPrefs?.getBool(AppConstants.seenOnboardingKey) ?? false;
  }

  Future<void> setSeenOnboarding(bool value) async {
    _sharedPrefs?.setBool(AppConstants.seenOnboardingKey, value);
  }

  Future<void> remove() async {
    await init();
    _sharedPrefs?.remove(AppConstants.tokenKey);
  }
}
