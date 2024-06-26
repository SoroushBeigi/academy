import 'package:academy/src/features/auth/presentation/cubit/auth_cubit.dart';

class AppConstants {
  static const int onboardingPagesCount = 3;
  static const String tokenKey = 'token';
  static const String saveContentList = 'saveContentList';
  static const String languageKey = 'language';
  static const String themeKey = 'theme';
  static const String baseUrl = 'http://172.16.251.80:8080';
  static const String baseUrlWithoutPort = 'http://172.16.251.80';
  static const String loggedInKey = 'loggedIn';
  static const String imageUrl =
      'https://fastly.picsum.photos/id/1044/200/200.jpg?hmac=HB3e6tTss6J_9wexZ1v1psMlccdyQIrHrrijUgWXFhg';
  static bool isDark = false;
  static bool isFa = false;
  static const bool showApprovedOnly = true;
}
