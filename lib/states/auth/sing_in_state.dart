import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';
import 'package:pet_shelter_new/models/sign_in_request/sign_in_request.dart';
import 'package:pet_shelter_new/services/network_service.dart';
import 'package:pet_shelter_new/states/auth/auth_validator.dart';

part 'sing_in_state.g.dart';

class SignInState = SignInStateBase with _$SignInState;

abstract class SignInStateBase with Store {

  final NetworkService networkService;

  SignInStateBase({required this.networkService});

  @observable String? email;
  @observable String? password;

  @observable String? emailError;
  @observable String? passwordError;
  @observable String? signInError;

  @action
  void onEmailChanged(String emailValue) {
    email = emailValue;
  }

  @action
  void onPasswordChanged(String passwordValue) {
    password = passwordValue;
  }

  @action
  Future<void> signIn(VoidCallback onSuccess) async {
    signInError = null;
    if (!_validateFields()) {
      return;
    }
    final result = await networkService.signIn(SignInRequest(email: email!, password: password!));
    if (result.success && result.body != null) {
      // _localStorage.saveAccessToken(result.body!.accessToken);
      // _localStorage.saveRefreshToken(result.body!.refreshToken);
      onSuccess();
    } else {
      signInError = AppStrings.defaultErrorMessage;
    }
  }

  bool _validateFields() {
    emailError = AuthValidator.validateEmail(email);
    passwordError = AuthValidator.validatePassword(password);
    return emailError == null && passwordError == null;
  }
}
