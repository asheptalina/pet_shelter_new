import 'dart:io';

import 'package:latlong2/latlong.dart';
import 'package:mobx/mobx.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';
import 'package:pet_shelter_new/models/pet_type.dart';

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
  Future<void> createAd() async {
    if (!_validateFields()) {
      return;
    }
    // TODO: upload real photo to firebase storage
    const imageUrl = 'https://www.princeton.edu/sites/default/files/styles/half_2x/public/images/2022/02/KOA_Nassau_2697x1517.jpg';
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
