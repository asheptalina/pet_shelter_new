import 'package:flutter/material.dart';
import 'package:pet_shelter_new/states/create_ad/create_ad_state.dart';
import 'package:pet_shelter_new/views/components/add_photo_widget.dart';

class CreateAdAddPhotoWidget extends StatelessWidget {
  final CreateAdState state;

  const CreateAdAddPhotoWidget({required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AddPhotoWidget(onSuccess: (file) {
      state.savePhoto(file);
      state.selectScreen(CreateAdScreen.reviewPhoto);
    });
  }
}