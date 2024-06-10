import 'package:academy/src/core/resources/app_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
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

  void setLoggedIn(bool value) {
    _sharedPrefs?.setBool(AppConstants.loggedInKey, value);
  }

  Future<void> removeToken() async {
    await init();
    _sharedPrefs?.remove(AppConstants.tokenKey);
  }

  void saveVideo(int id) {
    final savedVideos = _sharedPrefs!.getStringList(AppConstants.saveKey);
    late final List<String> newSavedVideos;
    if (savedVideos?.any(
          (element) => element == id.toString(),
        ) ??
        false) {
      newSavedVideos = savedVideos ?? [];
      newSavedVideos.removeWhere(
        (element) => element == id.toString(),
      );
    } else {
      newSavedVideos = (savedVideos ?? <String>[]) + [id.toString()];
    }

    _sharedPrefs?.setStringList(AppConstants.saveKey, newSavedVideos);
  }

  List<String> getSavedVideos() =>
      _sharedPrefs?.getStringList(AppConstants.saveKey) ?? [];

  void setIsFa(bool value) =>
      _sharedPrefs?.setBool(AppConstants.languageKey, value);

  bool isFa() => _sharedPrefs?.getBool(AppConstants.languageKey) ?? false;
}
