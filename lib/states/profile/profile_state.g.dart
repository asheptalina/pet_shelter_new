// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileState on ProfileStateBase, Store {
  late final _$userNameAtom =
      Atom(name: 'ProfileStateBase.userName', context: context);

  @override
  String? get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String? value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$avatarUrlAtom =
      Atom(name: 'ProfileStateBase.avatarUrl', context: context);

  @override
  String? get avatarUrl {
    _$avatarUrlAtom.reportRead();
    return super.avatarUrl;
  }

  @override
  set avatarUrl(String? value) {
    _$avatarUrlAtom.reportWrite(value, super.avatarUrl, () {
      super.avatarUrl = value;
    });
  }

  late final _$userNameErrorAtom =
      Atom(name: 'ProfileStateBase.userNameError', context: context);

  @override
  String? get userNameError {
    _$userNameErrorAtom.reportRead();
    return super.userNameError;
  }

  @override
  set userNameError(String? value) {
    _$userNameErrorAtom.reportWrite(value, super.userNameError, () {
      super.userNameError = value;
    });
  }

  late final _$saveErrorAtom =
      Atom(name: 'ProfileStateBase.saveError', context: context);

  @override
  String? get saveError {
    _$saveErrorAtom.reportRead();
    return super.saveError;
  }

  @override
  set saveError(String? value) {
    _$saveErrorAtom.reportWrite(value, super.saveError, () {
      super.saveError = value;
    });
  }

  late final _$getUserInfoAsyncAction =
      AsyncAction('ProfileStateBase.getUserInfo', context: context);

  @override
  Future<void> getUserInfo(VoidCallback onUnauthorized) {
    return _$getUserInfoAsyncAction
        .run(() => super.getUserInfo(onUnauthorized));
  }

  late final _$saveAsyncAction =
      AsyncAction('ProfileStateBase.save', context: context);

  @override
  Future<void> save(VoidCallback onSuccess, VoidCallback onUnauthorized) {
    return _$saveAsyncAction.run(() => super.save(onSuccess, onUnauthorized));
  }

  late final _$ProfileStateBaseActionController =
      ActionController(name: 'ProfileStateBase', context: context);

  @override
  void onUserNameChanged(String nameValue) {
    final _$actionInfo = _$ProfileStateBaseActionController.startAction(
        name: 'ProfileStateBase.onUserNameChanged');
    try {
      return super.onUserNameChanged(nameValue);
    } finally {
      _$ProfileStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onAvatarUrlChanged(String passwordValue) {
    final _$actionInfo = _$ProfileStateBaseActionController.startAction(
        name: 'ProfileStateBase.onAvatarUrlChanged');
    try {
      return super.onAvatarUrlChanged(passwordValue);
    } finally {
      _$ProfileStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userName: ${userName},
avatarUrl: ${avatarUrl},
userNameError: ${userNameError},
saveError: ${saveError}
    ''';
  }
}
