import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_shelter_new/consts/app_assets.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';
import 'package:pet_shelter_new/states/create_ad/create_ad_state.dart';
import 'package:pet_shelter_new/ui_consts/main_ui_consts.dart';
import 'package:pet_shelter_new/views/components/custom_app_bar.dart';
import 'package:pet_shelter_new/views/components/primary_button.dart';
import 'package:provider/provider.dart';

class CreateAdReviewPhotoWidget extends StatelessWidget {

  final CreateAdState state;

  const CreateAdReviewPhotoWidget({required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    CreateAdState state = Provider.of<CreateAdState>(context);
    return Padding(
      padding: EdgeInsets.only(bottom: screenSize.height * MainUIConstants.bottomButtonPaddingCof),
      child: Column(
        children: [
          CustomAppBar(
              header: AppStrings.addPhotoHeader,
              onBack: () => state.selectScreen(CreateAdScreen.addPhoto)
          ),
          _buildPhoto(state.photoFile),
          const Spacer(),
          PrimaryButton(
              label: AppStrings.specifyAddressButton,
              onPressed: () => state.selectScreen(CreateAdScreen.specifyAddress)
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
}
