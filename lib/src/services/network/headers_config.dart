class HeadersConfig {
  static Map<String, dynamic> headersWithToken(String token) {
    return <String, dynamic>{
      'Authorization': 'Bearer $token',
      'content-type': 'application/json',
      'Accept': 'application/json'
    };
  }

  static Map<String, dynamic> headersWithOutToken = <String, dynamic>{
    'content-type': 'application/json',
    'Accept': 'application/json'
  };
}