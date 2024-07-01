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

  Future setSavedContent(String listContentId) async{
    await _sharedPrefs!.setString(AppConstants.saveContentList, listContentId);
  }

  String getSavedContent() =>
      _sharedPrefs?.getString(AppConstants.saveContentList) ?? '';

  Future remove(String key) async{
    await _sharedPrefs?.remove(key);

  }

  void setIsFa(bool value) =>
      _sharedPrefs?.setBool(AppConstants.languageKey, value);

  bool isFa() => _sharedPrefs?.getBool(AppConstants.languageKey) ?? true;

  void setIsDark(bool value) =>
      _sharedPrefs?.setBool(AppConstants.themeKey, value);

  bool isDark() {
    return _sharedPrefs?.getBool(AppConstants.themeKey) ?? false;
  }

  String getUsername() => _sharedPrefs?.getString('username') ?? '-';

  int getId() => _sharedPrefs?.getInt('id') ?? -1;

  void setUserData(String? username, int? id){
    _sharedPrefs?.setString('username', username ?? '-');
    _sharedPrefs?.setInt('id', id ?? -1);
  }
}
