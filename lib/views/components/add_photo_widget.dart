import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_shelter_new/consts/app_assets.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';
import 'package:pet_shelter_new/consts/app_types.dart';
import 'package:pet_shelter_new/ui_consts/create_ad_ui_consts.dart';
import 'package:pet_shelter_new/views/components/custom_app_bar.dart';
import 'package:pet_shelter_new/views/components/primary_button.dart';

class AddPhotoWidget extends StatelessWidget {
  final FileCallback onSuccess;
  final VoidCallback? onBack;

  const AddPhotoWidget({required this.onSuccess, this.onBack, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomAppBar(header: AppStrings.addPhotoHeader, onBack: onBack),
        const Spacer(),
        PrimaryButton(
            label: AppStrings.uploadPhotoButton,
            icon: AppAssets.galleryIcon,
            width: screenSize.width * CreateAdUIConstants.photoButtonWidthCof,
            onPressed: () => _onAddPhoto(context)
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: PrimaryButton(
              label: AppStrings.takePhotoButton,
              icon: AppAssets.photoIcon,
              width: screenSize.width * CreateAdUIConstants.photoButtonWidthCof,
              onPressed: () => {}
          ),
        ),
        const Spacer(),
      ],
    );
  }

  void _onAddPhoto(BuildContext context) async {
    XFile? image = await GetIt.instance.get<ImagePicker>().pickImage(source: ImageSource.gallery);
    if (image != null) {
      onSuccess(File(image.path));
    }
  }
}
