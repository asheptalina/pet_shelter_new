import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pet_shelter_new/consts/app_assets.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';
import 'package:pet_shelter_new/consts/app_types.dart';
import 'package:pet_shelter_new/ui_consts/create_ad_ui_consts.dart';
import 'package:pet_shelter_new/views/components/alert_widget.dart';
import 'package:pet_shelter_new/views/components/custom_app_bar.dart';
import 'package:pet_shelter_new/views/components/primary_button.dart';
import 'package:pet_shelter_new/views/components/secondary_button.dart';

class AddPhotoWidget extends StatefulWidget {
  final FileCallback onSuccess;
  final VoidCallback? onBack;

  const AddPhotoWidget({required this.onSuccess, this.onBack, Key? key}) : super(key: key);

  @override
  State<AddPhotoWidget> createState() => _AddPhotoWidgetState();
}

class _AddPhotoWidgetState extends State<AddPhotoWidget> {
  bool _showGoToSettingsAlert = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(opacity: _showGoToSettingsAlert ? 0.4 : 1, child: _buildContent(context)),
        _buildGoToSettingsAlert()
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomAppBar(header: AppStrings.addPhotoHeader, onBack: widget.onBack),
        const Spacer(),
        PrimaryButton(
            label: AppStrings.uploadPhotoButton,
            icon: AppAssets.galleryIcon,
            width: screenSize.width * CreateAdUIConstants.photoButtonWidthCof,
            onPressed: () async {
              if (!await Permission.photos.request().isGranted) {
                setState(() => _showGoToSettingsAlert = true);
              } else {
                _onAddPhoto(source: ImageSource.gallery);
              }
            }
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: PrimaryButton(
              label: AppStrings.takePhotoButton,
              icon: AppAssets.photoIcon,
              width: screenSize.width * CreateAdUIConstants.photoButtonWidthCof,
              onPressed: () async {
                if (!await Permission.camera.request().isGranted) {
                  setState(() => _showGoToSettingsAlert = true);
                } else {
                  _onAddPhoto(source: ImageSource.camera);
                }
              }
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Widget _buildGoToSettingsAlert() {
    return _showGoToSettingsAlert ? AlertWidget(
      title: AppStrings.askPhotoPermissionAlertTitle,
      actions: [
          SecondaryButton(
            label: AppStrings.cancelButton,
            onPressed: () => setState(() => _showGoToSettingsAlert = false)
          ),
          PrimaryButton(label: AppStrings.goToSettingsButton, onPressed: () {
            setState(() => _showGoToSettingsAlert = false);
            openAppSettings();
          })
        ]
    ) : const SizedBox.shrink();
  }

  void _onAddPhoto({required ImageSource source}) async {
    XFile? image = await GetIt.instance.get<ImagePicker>().pickImage(source: source);
    if (image != null) {
      widget.onSuccess(File(image.path));
    }
  }
}
