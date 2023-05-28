import 'package:flutter/foundation.dart';
import 'package:pet_shelter_new/repositories/local_storage/local_storage.dart';

class AppState extends ChangeNotifier {
  final LocalStorage localStorage;

  AppState({required this.localStorage});

  bool get isAuthorized =>
      localStorage.getAccessToken() != null && localStorage.getRefreshToken() != null;

  void updateState() {
    notifyListeners();
  }

  void logout() {
    localStorage.removeAccessToken();
    localStorage.removeRefreshToken();
    notifyListeners();
  }
}