import 'package:pet_shelter_new/repositories/local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesStorage implements LocalStorage {
  SharedPreferences? _preferences;

  static const _accessTokenKey = "access_token";
  static const _refreshTokenKey = "refresh_token";

  init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  String? getAccessToken() {
    return _preferences?.getString(_accessTokenKey);
  }

  @override
  String? getRefreshToken() {
    return _preferences?.getString(_refreshTokenKey);
  }

  @override
  saveAccessToken(String token) {
    _preferences?.setString(_accessTokenKey, token);
  }

  @override
  saveRefreshToken(String token) {
    _preferences?.setString(_refreshTokenKey, token);
  }

  @override
  removeAccessToken() {
    _preferences?.remove(_accessTokenKey);
  }

  @override
  removeRefreshToken() {
    _preferences?.remove(_refreshTokenKey);
  }
}