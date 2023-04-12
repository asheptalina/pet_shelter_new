// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sing_in_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInState on SignInStateBase, Store {
  late final _$emailAtom =
      Atom(name: 'SignInStateBase.email', context: context);

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
      Atom(name: 'SignInStateBase.password', context: context);

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

  late final _$emailErrorAtom =
      Atom(name: 'SignInStateBase.emailError', context: context);

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
      Atom(name: 'SignInStateBase.passwordError', context: context);

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

  late final _$signInErrorAtom =
      Atom(name: 'SignInStateBase.signInError', context: context);

  @override
  String? get signInError {
    _$signInErrorAtom.reportRead();
    return super.signInError;
  }

  @override
  set signInError(String? value) {
    _$signInErrorAtom.reportWrite(value, super.signInError, () {
      super.signInError = value;
    });
  }

  late final _$SignInStateBaseActionController =
      ActionController(name: 'SignInStateBase', context: context);

  @override
  void onEmailChanged(String emailValue) {
    final _$actionInfo = _$SignInStateBaseActionController.startAction(
        name: 'SignInStateBase.onEmailChanged');
    try {
      return super.onEmailChanged(emailValue);
    } finally {
      _$SignInStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPasswordChanged(String passwordValue) {
    final _$actionInfo = _$SignInStateBaseActionController.startAction(
        name: 'SignInStateBase.onPasswordChanged');
    try {
      return super.onPasswordChanged(passwordValue);
    } finally {
      _$SignInStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void signIn(VoidCallback onSuccess) {
    final _$actionInfo = _$SignInStateBaseActionController.startAction(
        name: 'SignInStateBase.signIn');
    try {
      return super.signIn(onSuccess);
    } finally {
      _$SignInStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
emailError: ${emailError},
passwordError: ${passwordError},
signInError: ${signInError}
    ''';
  }
}
