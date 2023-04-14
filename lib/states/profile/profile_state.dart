import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:pet_shelter_new/states/auth/auth_validator.dart';

part 'profile_state.g.dart';

class ProfileState = ProfileStateBase with _$ProfileState;

enum ProfileScreen {
  view, edit;
}

abstract class ProfileStateBase with Store {
  @observable ProfileScreen selectedScreen = ProfileScreen.edit;
  @observable String? userName;
  @observable String? avatarUrl;

  @observable String? userNameError;
  @observable String? saveError;

  @action
  void selectScreen(ProfileScreen screen) {
    if (selectedScreen != screen) {
      selectedScreen = screen;
    }
  }

  @action
  void onUserNameChanged(String nameValue) {
    userName = nameValue;
  }

  @action
  void onAvatarUrlChanged(String passwordValue) {
    avatarUrl = passwordValue;
  }

  @action
  void save(VoidCallback onSuccess) {
    saveError = null;
    if (!_validateFields()) {
      return;
    }
  }

  bool _validateFields() {
    userName = AuthValidator.validateName(userName);
    return userName == null;
  }
}
