import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';
import 'package:pet_shelter_new/models/dto/sign_up_request/sign_up_request.dart';
import 'package:pet_shelter_new/models/request_result.dart';
import 'package:pet_shelter_new/repositories/local_storage/local_storage.dart';
import 'package:pet_shelter_new/services/network_service.dart';
import 'package:pet_shelter_new/states/auth/auth_validator.dart';

part 'sing_up_state.g.dart';

class SignUpState = SignUpStateBase with _$SignUpState;

abstract class SignUpStateBase with Store {
  final NetworkService networkService;
  final LocalStorage localStorage;

  SignUpStateBase({required this.networkService, required this.localStorage});

  @observable String? name;
  @observable String? email;
  @observable String? password;
  @observable String? confirmPassword;

  @observable String? nameError;
  @observable String? emailError;
  @observable String? passwordError;
  @observable String? confirmPasswordError;

  @observable String? signUpError;

  @observable bool inProgress = false;

  @action
  void onNameChanged(String nameValue) {
    name = nameValue;
  }

  @action
  void onEmailChanged(String emailValue) {
    email = emailValue;
  }

  @action
  void onPasswordChanged(String passwordValue) {
    password = passwordValue;
  }

  @action
  void onConfirmPasswordChanged(String confirmPasswordValue) {
    confirmPassword = confirmPasswordValue;
  }

  @action
  Future<void> signUp(VoidCallback onSuccess) async {
    signUpError = null;
    if (!_validateFields()) {
      return;
    }
    inProgress = true;
    final result = await networkService.signUp(
        SignUpRequest(email: email!, password: password!, userName: name!)
    );
    if (result.status == RequestStatus.success && result.body != null) {
      localStorage.saveAccessToken(result.body!.accessToken);
      localStorage.saveRefreshToken(result.body!.refreshToken);
      onSuccess();
    } else {
      signUpError = AppStrings.defaultErrorMessage;
    }
    inProgress = false;
  }

  bool _validateFields() {
    nameError = AuthValidator.validateName(name);
    emailError = AuthValidator.validateEmail(email);
    passwordError = AuthValidator.validatePassword(password);
    confirmPasswordError = AuthValidator.validateConfirmPassword(password, confirmPassword);
    return nameError == null && emailError == null && passwordError == null
        && confirmPasswordError == null;
  }
}

