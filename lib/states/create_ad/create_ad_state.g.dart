// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ad_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateAdState on CreateAdStateBase, Store {
  late final _$selectedScreenAtom =
      Atom(name: 'CreateAdStateBase.selectedScreen', context: context);

  @override
  CreateAdScreen get selectedScreen {
    _$selectedScreenAtom.reportRead();
    return super.selectedScreen;
  }

  @override
  set selectedScreen(CreateAdScreen value) {
    _$selectedScreenAtom.reportWrite(value, super.selectedScreen, () {
      super.selectedScreen = value;
    });
  }

  late final _$photoFileAtom =
      Atom(name: 'CreateAdStateBase.photoFile', context: context);

  @override
  File? get photoFile {
    _$photoFileAtom.reportRead();
    return super.photoFile;
  }

  @override
  set photoFile(File? value) {
    _$photoFileAtom.reportWrite(value, super.photoFile, () {
      super.photoFile = value;
    });
  }

  late final _$coordinateAtom =
      Atom(name: 'CreateAdStateBase.coordinate', context: context);

  @override
  LatLng? get coordinate {
    _$coordinateAtom.reportRead();
    return super.coordinate;
  }

  @override
  set coordinate(LatLng? value) {
    _$coordinateAtom.reportWrite(value, super.coordinate, () {
      super.coordinate = value;
    });
  }

  late final _$petTypeAtom =
      Atom(name: 'CreateAdStateBase.petType', context: context);

  @override
  PetType get petType {
    _$petTypeAtom.reportRead();
    return super.petType;
  }

  @override
  set petType(PetType value) {
    _$petTypeAtom.reportWrite(value, super.petType, () {
      super.petType = value;
    });
  }

  late final _$titleAtom =
      Atom(name: 'CreateAdStateBase.title', context: context);

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: 'CreateAdStateBase.description', context: context);

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$titleErrorAtom =
      Atom(name: 'CreateAdStateBase.titleError', context: context);

  @override
  String? get titleError {
    _$titleErrorAtom.reportRead();
    return super.titleError;
  }

  @override
  set titleError(String? value) {
    _$titleErrorAtom.reportWrite(value, super.titleError, () {
      super.titleError = value;
    });
  }

  late final _$descriptionErrorAtom =
      Atom(name: 'CreateAdStateBase.descriptionError', context: context);

  @override
  String? get descriptionError {
    _$descriptionErrorAtom.reportRead();
    return super.descriptionError;
  }

  @override
  set descriptionError(String? value) {
    _$descriptionErrorAtom.reportWrite(value, super.descriptionError, () {
      super.descriptionError = value;
    });
  }

  late final _$inProgressAtom =
      Atom(name: 'CreateAdStateBase.inProgress', context: context);

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

  late final _$createAdAsyncAction =
      AsyncAction('CreateAdStateBase.createAd', context: context);

  @override
  Future<void> createAd(void Function(Announcement) onSuccess,
      VoidCallback onFailure, VoidCallback onUnauthorized) {
    return _$createAdAsyncAction
        .run(() => super.createAd(onSuccess, onFailure, onUnauthorized));
  }

  late final _$CreateAdStateBaseActionController =
      ActionController(name: 'CreateAdStateBase', context: context);

  @override
  void selectScreen(CreateAdScreen screen) {
    final _$actionInfo = _$CreateAdStateBaseActionController.startAction(
        name: 'CreateAdStateBase.selectScreen');
    try {
      return super.selectScreen(screen);
    } finally {
      _$CreateAdStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void savePhoto(File photoFile) {
    final _$actionInfo = _$CreateAdStateBaseActionController.startAction(
        name: 'CreateAdStateBase.savePhoto');
    try {
      return super.savePhoto(photoFile);
    } finally {
      _$CreateAdStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveCoordinate(LatLng coordinate) {
    final _$actionInfo = _$CreateAdStateBaseActionController.startAction(
        name: 'CreateAdStateBase.saveCoordinate');
    try {
      return super.saveCoordinate(coordinate);
    } finally {
      _$CreateAdStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectPetType(PetType petType) {
    final _$actionInfo = _$CreateAdStateBaseActionController.startAction(
        name: 'CreateAdStateBase.selectPetType');
    try {
      return super.selectPetType(petType);
    } finally {
      _$CreateAdStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTitleChanged(String titleValue) {
    final _$actionInfo = _$CreateAdStateBaseActionController.startAction(
        name: 'CreateAdStateBase.onTitleChanged');
    try {
      return super.onTitleChanged(titleValue);
    } finally {
      _$CreateAdStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onDescriptionChanged(String descriptionValue) {
    final _$actionInfo = _$CreateAdStateBaseActionController.startAction(
        name: 'CreateAdStateBase.onDescriptionChanged');
    try {
      return super.onDescriptionChanged(descriptionValue);
    } finally {
      _$CreateAdStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedScreen: ${selectedScreen},
photoFile: ${photoFile},
coordinate: ${coordinate},
petType: ${petType},
title: ${title},
description: ${description},
titleError: ${titleError},
descriptionError: ${descriptionError},
inProgress: ${inProgress}
    ''';
  }
}
