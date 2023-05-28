import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';
import 'package:pet_shelter_new/models/dto/user_data/user_data.dart';
import 'package:pet_shelter_new/models/request_result.dart';
import 'package:pet_shelter_new/repositories/local_storage/local_storage.dart';
import 'package:pet_shelter_new/services/network_service.dart';
import 'package:pet_shelter_new/states/auth/auth_validator.dart';

part 'profile_state.g.dart';

class ProfileState = ProfileStateBase with _$ProfileState;

abstract class ProfileStateBase with Store {
  @observable String? userName;
  @observable String? avatarUrl;

  @observable String? userNameError;
  @observable String? saveError;

  final LocalStorage localStorage;
  final NetworkService networkService;

  ProfileStateBase({required this.localStorage, required this.networkService});

  @action
  Future<void> getUserInfo(VoidCallback onUnauthorized) async {
    final result = await networkService.getUserInfo(localStorage.getAccessToken() ?? '');
    if (result.status == RequestStatus.success && result.body != null) {
      userName = result.body!.userName;
      avatarUrl = result.body!.avatarUrl;
    } else if (result.status == RequestStatus.tokenExpired) {
        onUnauthorized();
    } else {
      saveError = AppStrings.defaultErrorMessage;
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
  Future<void> save(VoidCallback onSuccess, VoidCallback onUnauthorized) async {
    saveError = null;
    if (!_validateFields()) {
      return;
    }
    final result = await networkService.updateUserInfo(
        localStorage.getAccessToken() ?? '',
        UserData(userName: userName ?? '', avatarUrl: avatarUrl ?? '')
    );
    if (result.status == RequestStatus.success && result.body != null) {
      userName = result.body!.userName;
      avatarUrl = result.body!.avatarUrl;
      onSuccess();
    } else if (result.status == RequestStatus.tokenExpired) {
      onUnauthorized();
    } else {
      saveError = AppStrings.defaultErrorMessage;
    }
  }

  bool _validateFields() {
    userNameError = AuthValidator.validateName(userName);
    return userNameError == null;
  }
}
