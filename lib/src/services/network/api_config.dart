class ApiConfig {
  ApiConfig._();

  /// **** Production ****
  static const String baseApiUrl = "http://172.16.251.80:8080";

  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration connectionTimeout = Duration(seconds: 30);

  static const String getAllUsers = '$baseApiUrl/users';
  static const String getAllContent = '$baseApiUrl/content';
  static const String uploadVideo = '$baseApiUrl/content/upload';
}