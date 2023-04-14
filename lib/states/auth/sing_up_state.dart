import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';
import 'package:pet_shelter_new/models/sign_up_request/sign_up_request.dart';
import 'package:pet_shelter_new/services/network_service.dart';
import 'package:pet_shelter_new/states/auth/auth_validator.dart';

part 'sing_up_state.g.dart';

class SignUpState = SignUpStateBase with _$SignUpState;

abstract class SignUpStateBase with Store {
  final NetworkService networkService;

  SignUpStateBase({required this.networkService});

  @observable String? name;
  @observable String? email;
  @observable String? password;
  @observable String? confirmPassword;

  @observable String? nameError;
  @observable String? emailError;
  @observable String? passwordError;
  @observable String? confirmPasswordError;

  @observable String? signUpError;

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
    final result = await networkService.signUp(
        SignUpRequest(email: email!, password: password!, userName: name!)
    );
    if (result.success && result.body != null) {
      // _localStorage.saveAccessToken(result.body!.accessToken);
      // _localStorage.saveRefreshToken(result.body!.refreshToken);
      onSuccess();
    } else {
      signUpError = AppStrings.defaultErrorMessage;
    }
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

