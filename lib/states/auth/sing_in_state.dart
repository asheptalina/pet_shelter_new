import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:pet_shelter_new/states/auth/auth_validator.dart';

part 'sing_in_state.g.dart';

class SignInState = SignInStateBase with _$SignInState;

abstract class SignInStateBase with Store {
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
  void signIn(VoidCallback onSuccess) {
    signInError = null;
    if (!_validateFields()) {
      return;
    }
  }

  bool _validateFields() {
    emailError = AuthValidator.validateEmail(email);
    passwordError = AuthValidator.validatePassword(password);
    return emailError == null && passwordError == null;
  }
}
