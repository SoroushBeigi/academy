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

  bool getLoggedIn() {
    return _sharedPrefs?.getBool(AppConstants.loggedInKey) ?? false;
  }

  Future<void> setLoggedIn(bool value) async {
    _sharedPrefs?.setBool(AppConstants.loggedInKey, value);
  }

  Future<void> removeToken() async {
    await init();
    _sharedPrefs?.remove(AppConstants.tokenKey);
  }
}
