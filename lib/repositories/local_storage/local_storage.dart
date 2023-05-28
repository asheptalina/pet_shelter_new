abstract class LocalStorage {
  saveAccessToken(String token);
  removeAccessToken();
  String? getAccessToken();

  saveRefreshToken(String token);
  removeRefreshToken();
  String? getRefreshToken();
}