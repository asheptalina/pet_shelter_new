// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sing_up_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpState on SignUpStateBase, Store {
  late final _$nameAtom = Atom(name: 'SignUpStateBase.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'SignUpStateBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'SignUpStateBase.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: 'SignUpStateBase.confirmPassword', context: context);

  @override
  String? get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String? value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$nameErrorAtom =
      Atom(name: 'SignUpStateBase.nameError', context: context);

  @override
  String? get nameError {
    _$nameErrorAtom.reportRead();
    return super.nameError;
  }

  @override
  set nameError(String? value) {
    _$nameErrorAtom.reportWrite(value, super.nameError, () {
      super.nameError = value;
    });
  }

  late final _$emailErrorAtom =
      Atom(name: 'SignUpStateBase.emailError', context: context);

  @override
  String? get emailError {
    _$emailErrorAtom.reportRead();
    return super.emailError;
  }

  @override
  set emailError(String? value) {
    _$emailErrorAtom.reportWrite(value, super.emailError, () {
      super.emailError = value;
    });
  }

  late final _$passwordErrorAtom =
      Atom(name: 'SignUpStateBase.passwordError', context: context);

  @override
  String? get passwordError {
    _$passwordErrorAtom.reportRead();
    return super.passwordError;
  }

  @override
  set passwordError(String? value) {
    _$passwordErrorAtom.reportWrite(value, super.passwordError, () {
      super.passwordError = value;
    });
  }

  late final _$confirmPasswordErrorAtom =
      Atom(name: 'SignUpStateBase.confirmPasswordError', context: context);

  @override
  String? get confirmPasswordError {
    _$confirmPasswordErrorAtom.reportRead();
    return super.confirmPasswordError;
  }

  @override
  set confirmPasswordError(String? value) {
    _$confirmPasswordErrorAtom.reportWrite(value, super.confirmPasswordError,
        () {
      super.confirmPasswordError = value;
    });
  }

  late final _$signUpErrorAtom =
      Atom(name: 'SignUpStateBase.signUpError', context: context);

  @override
  String? get signUpError {
    _$signUpErrorAtom.reportRead();
    return super.signUpError;
  }

  @override
  set signUpError(String? value) {
    _$signUpErrorAtom.reportWrite(value, super.signUpError, () {
      super.signUpError = value;
    });
  }

  late final _$inProgressAtom =
      Atom(name: 'SignUpStateBase.inProgress', context: context);

  @override
  bool get inProgress {
    _$inProgressAtom.reportRead();
    return super.inProgress;
  }

  @override
  set inProgress(bool value) {
    _$inProgressAtom.reportWrite(value, super.inProgress, () {
      super.inProgress = value;
    });
  }

  late final _$signUpAsyncAction =
      AsyncAction('SignUpStateBase.signUp', context: context);

  @override
  Future<void> signUp(VoidCallback onSuccess) {
    return _$signUpAsyncAction.run(() => super.signUp(onSuccess));
  }

  late final _$SignUpStateBaseActionController =
      ActionController(name: 'SignUpStateBase', context: context);

  @override
  void onNameChanged(String nameValue) {
    final _$actionInfo = _$SignUpStateBaseActionController.startAction(
        name: 'SignUpStateBase.onNameChanged');
    try {
      return super.onNameChanged(nameValue);
    } finally {
      _$SignUpStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onEmailChanged(String emailValue) {
    final _$actionInfo = _$SignUpStateBaseActionController.startAction(
        name: 'SignUpStateBase.onEmailChanged');
    try {
      return super.onEmailChanged(emailValue);
    } finally {
      _$SignUpStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPasswordChanged(String passwordValue) {
    final _$actionInfo = _$SignUpStateBaseActionController.startAction(
        name: 'SignUpStateBase.onPasswordChanged');
    try {
      return super.onPasswordChanged(passwordValue);
    } finally {
      _$SignUpStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onConfirmPasswordChanged(String confirmPasswordValue) {
    final _$actionInfo = _$SignUpStateBaseActionController.startAction(
        name: 'SignUpStateBase.onConfirmPasswordChanged');
    try {
      return super.onConfirmPasswordChanged(confirmPasswordValue);
    } finally {
      _$SignUpStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
nameError: ${nameError},
emailError: ${emailError},
passwordError: ${passwordError},
confirmPasswordError: ${confirmPasswordError},
signUpError: ${signUpError},
inProgress: ${inProgress}
    ''';
  }
}
