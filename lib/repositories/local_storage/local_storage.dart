abstract class LocalStorage {
  saveAccessToken(String token);
  String? getAccessToken();

  saveRefreshToken(String token);
  String? getRefreshToken();
}