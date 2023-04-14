import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_shelter_new/consts/app_assets.dart';
import 'package:pet_shelter_new/consts/app_colors.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';
import 'package:pet_shelter_new/states/profile/profile_state.dart';
import 'package:pet_shelter_new/ui_consts/main_ui_consts.dart';
import 'package:pet_shelter_new/ui_consts/profile_ui_consts.dart';
import 'package:pet_shelter_new/views/components/custom_app_bar.dart';
import 'package:pet_shelter_new/views/components/custom_form_field.dart';
import 'package:pet_shelter_new/views/components/primary_button.dart';

class ProfileEditWidget extends StatelessWidget {

  final ProfileState state;

  const ProfileEditWidget({required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          header: AppStrings.profileEditing,
          onBack: () => state.selectScreen(ProfileScreen.view)
        ),
        Expanded(child: _buildContent(context))
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MainUIConstants.verticalPadding,
          horizontal: screenSize.width * MainUIConstants.horizontalPaddingCof
      ),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: MainUIConstants.formFieldVerticalSpacing),
              child: _buildPhoto(state.avatarUrl, screenSize)
          ),
          CustomFormField(
              value: state.userName,
              labelText: AppStrings.nameFormFieldHint,
              onChanged: (value) => state.onUserNameChanged(value)
          ),
          const Spacer(),
          PrimaryButton(label: AppStrings.saveButton, onPressed: () {
            state.save(() { });
          })
        ],
      ),
    );
  }

  Widget _buildPhoto(String? photoUrl, Size screenSize) {
    final avatarSize = screenSize.width * ProfileUIConstants.avatarSizeCof;
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Center(
          child: Container(
            decoration: const BoxDecoration(shape: BoxShape.circle),
            width: avatarSize,
            height: avatarSize,
            clipBehavior: Clip.hardEdge,
            child: photoUrl == null ? SvgPicture.asset(AppAssets.placeholderImage) : Image.network(photoUrl),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(left: avatarSize - ProfileUIConstants.addPhotoButtonSize),
            child: _buildAddPhotoButton()
          ),
        )
      ],
    );
  }

  Widget _buildAddPhotoButton() {
    return GestureDetector(
      onTap: () {}, // TODO: photo
      child: Container(
          decoration: BoxDecoration(
            color: AppColors.accent,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 2),
                blurRadius: 6
            )]
          ),
          width: ProfileUIConstants.addPhotoButtonSize,
          height: ProfileUIConstants.addPhotoButtonSize,
          child: Center(
              child: SvgPicture.asset(AppAssets.addPhotoIcon, color: Colors.white)
          )
      )
    );
  }
}
