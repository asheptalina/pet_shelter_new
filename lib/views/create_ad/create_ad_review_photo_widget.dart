import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pet_shelter_new/consts/app_assets.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';
import 'package:pet_shelter_new/states/create_ad/create_ad_state.dart';
import 'package:pet_shelter_new/ui_consts/main_ui_consts.dart';
import 'package:pet_shelter_new/views/components/alert_widget.dart';
import 'package:pet_shelter_new/views/components/custom_app_bar.dart';
import 'package:pet_shelter_new/views/components/primary_button.dart';
import 'package:pet_shelter_new/views/components/secondary_button.dart';

class CreateAdReviewPhotoWidget extends StatefulWidget {
  final CreateAdState state;

  const CreateAdReviewPhotoWidget({required this.state, Key? key}) : super(key: key);

  @override
  State<CreateAdReviewPhotoWidget> createState() => _CreateAdReviewPhotoWidgetState();
}

class _CreateAdReviewPhotoWidgetState extends State<CreateAdReviewPhotoWidget> {

  bool _showGoToSettingsAlert = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(opacity: _showGoToSettingsAlert ? 0.4 : 1, child: _buildContent()),
        _buildGoToSettingsAlert()
      ],
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.only(bottom: MainUIConstants.verticalPadding),
      child: Column(
        children: [
          CustomAppBar(
              header: AppStrings.addPhotoHeader,
              onBack: () => widget.state.selectScreen(CreateAdScreen.addPhoto)
          ),
          _buildPhoto(widget.state.photoFile),
          const Spacer(),
          PrimaryButton(
              label: AppStrings.specifyAddressButton,
              icon: AppAssets.arrowForwardIcon,
              iconLeading: false,
              onPressed: () async {
                if (!await Permission.location.request().isGranted) {
                  setState(() => _showGoToSettingsAlert = true);
                } else {
                  widget.state.selectScreen(CreateAdScreen.specifyAddress);
                }
              }
          )
        ],
      ),
    );
  }

  Widget _buildPhoto(File? photoFile) {
    return AspectRatio(
      aspectRatio: 1,
      child: photoFile == null ? SvgPicture.asset(AppAssets.placeholderImage) : Image.file(photoFile, fit: BoxFit.cover),
    );
  }

  Widget _buildGoToSettingsAlert() {
    return _showGoToSettingsAlert ? AlertWidget(
        title: AppStrings.askLocationPermissionAlertTitle,
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
}
