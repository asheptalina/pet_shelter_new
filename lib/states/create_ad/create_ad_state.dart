import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobx/mobx.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';
import 'package:pet_shelter_new/models/dto/announcement/announcement.dart';
import 'package:pet_shelter_new/models/dto/geo_position/geo_position.dart';
import 'package:pet_shelter_new/models/pet_type.dart';
import 'package:pet_shelter_new/models/request_result.dart';
import 'package:pet_shelter_new/repositories/local_storage/local_storage.dart';
import 'package:pet_shelter_new/services/network_service.dart';
import 'package:uuid/uuid.dart';

part 'create_ad_state.g.dart';

class CreateAdState = CreateAdStateBase with _$CreateAdState;

enum CreateAdScreen {
  addPhoto, reviewPhoto, specifyAddress, addDescription
}

abstract class CreateAdStateBase with Store {
  @observable CreateAdScreen selectedScreen = CreateAdScreen.addPhoto;

  @observable File? photoFile;
  @observable LatLng? coordinate;
  @observable PetType petType = PetType.cat;
  @observable String? title;
  @observable String? description;

  @observable String? titleError;
  @observable String? descriptionError;

  final LocalStorage localStorage;
  final NetworkService networkService;

  final _storage = FirebaseStorage.instance;

  CreateAdStateBase({required this.localStorage, required this.networkService});

  @action
  void selectScreen(CreateAdScreen screen) {
    if (selectedScreen != screen) {
      selectedScreen = screen;
    }
  }

  @action
  void savePhoto(File photoFile) {
    this.photoFile = photoFile;
  }

  @action
  void saveCoordinate(LatLng coordinate) {
    this.coordinate = coordinate;
  }

  @action
  void selectPetType(PetType petType) {
    if (this.petType != petType) {
      this.petType = petType;
    }
  }

  @action
  void onTitleChanged(String titleValue) {
    title = titleValue;
  }

  @action
  void onDescriptionChanged(String descriptionValue) {
    description = descriptionValue;
  }

  @action
  Future<void> createAd(VoidCallback onSuccess, VoidCallback onFailure, VoidCallback onUnauthorized) async {
    if (!_validateFields()) {
      return;
    }
    String? photoUrl;
    if (photoFile != null) {
      final storageRef = _storage.ref();
      Reference? imagesRef = storageRef.child("images");
      final fileName = "${const Uuid().v4()}.jpg";
      final photoRef = imagesRef.child(fileName);
      try {
        final TaskSnapshot snapshot = await photoRef.putFile(photoFile!);
        print(snapshot.ref);
        photoUrl = await snapshot.ref.getDownloadURL();
      } on FirebaseException catch (e) {
        print("Can't load photo to Firebase storage: ${e.message}");
        onFailure();
      }
    }
    if (photoUrl != null) {
      final result = await networkService.createAd(
          localStorage.getAccessToken() ?? '',
          Announcement(
              petType: petType,
              imageUrl: photoUrl,
              title: title!,
              description: description!,
              geoPosition: GeoPosition(lat: coordinate!.latitude, lng: coordinate!.longitude)
          )
      );
      if (result.status == RequestStatus.success && result.body != null) {
        onSuccess();
      } else if (result.status == RequestStatus.tokenExpired) {
        onUnauthorized();
      } else {
        onFailure();
      }
    }
  }

  bool _validateFields() {
    titleError = null;
    descriptionError = null;
    if (title == null || title!.isEmpty) {
      titleError = AppStrings.emptyFieldError;
    } else if (title!.length > 46) {
      titleError = AppStrings.textTooLongError;
    }
    if (description == null || description!.isEmpty) {
      descriptionError = AppStrings.emptyFieldError;
    }
    return titleError == null && descriptionError == null;
  }
}
