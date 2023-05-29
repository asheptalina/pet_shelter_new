import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';
import 'package:pet_shelter_new/models/dto/user_data/user_data.dart';
import 'package:pet_shelter_new/models/request_result.dart';
import 'package:pet_shelter_new/repositories/local_storage/local_storage.dart';
import 'package:pet_shelter_new/services/network_service.dart';
import 'package:pet_shelter_new/states/auth/auth_validator.dart';
import 'package:uuid/uuid.dart';

part 'profile_state.g.dart';

class ProfileState = ProfileStateBase with _$ProfileState;

abstract class ProfileStateBase with Store {
  String? userName;
  String? avatarUrl;
  @observable String? currentUserName;
  @observable String? currentAvatarUrl;
  @observable File? avatarFile;

  @observable String? userNameError;
  @observable String? saveError;

  @computed bool get hasChanges => userName != currentUserName || avatarUrl != currentAvatarUrl;

  final LocalStorage localStorage;
  final NetworkService networkService;

  final _storage = FirebaseStorage.instance;

  ProfileStateBase({required this.localStorage, required this.networkService});

  @action
  Future<void> getUserInfo(VoidCallback onUnauthorized) async {
    final result = await networkService.getUserInfo(localStorage.getAccessToken() ?? '');
    if (result.status == RequestStatus.success && result.body != null) {
      userName = result.body!.userName;
      avatarUrl = result.body!.avatarUrl;
      currentUserName = currentUserName ?? userName;
      currentAvatarUrl = currentAvatarUrl ?? avatarUrl;
    } else if (result.status == RequestStatus.tokenExpired) {
        onUnauthorized();
    } else {
      saveError = AppStrings.defaultErrorMessage;
    }
  }

  @action
  void onUserNameChanged(String nameValue) {
    currentUserName = nameValue;
  }

  @action
  void clearChanges() {
    currentUserName = null;
    currentAvatarUrl = null;
  }

  @action
  Future<void> savePhoto(File photoFile, VoidCallback onSuccess, VoidCallback onFailure) async {
    final storageRef = _storage.ref();
    Reference? imagesRef = storageRef.child("images");
    final fileName = "${const Uuid().v4()}.jpg";
    final photoRef = imagesRef.child(fileName);
    try {
      final TaskSnapshot snapshot = await photoRef.putFile(photoFile);
      currentAvatarUrl = await snapshot.ref.getDownloadURL();
      onSuccess();
    } on FirebaseException catch (e) {
      print("Can't load photo to Firebase storage: ${e.message}");
      onFailure();
    }
  }

  @action
  Future<void> save(VoidCallback onSuccess, VoidCallback onUnauthorized) async {
    saveError = null;
    if (!_validateFields()) {
      return;
    }
    final result = await networkService.updateUserInfo(
        localStorage.getAccessToken() ?? '',
        UserData(userName: currentUserName ?? '', avatarUrl: currentAvatarUrl ?? '')
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
    userNameError = AuthValidator.validateName(currentUserName);
    return userNameError == null;
  }
}
