import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_shelter_new/consts/app_assets.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';
import 'package:pet_shelter_new/states/profile/profile_state.dart';
import 'package:pet_shelter_new/ui_consts/main_ui_consts.dart';
import 'package:pet_shelter_new/ui_consts/profile_ui_consts.dart';
import 'package:pet_shelter_new/views/components/custom_app_bar.dart';
import 'package:pet_shelter_new/views/components/secondary_button.dart';

class ProfileViewWidget extends StatelessWidget {

  final ProfileState state;

  const ProfileViewWidget({required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          actionIcon: AppAssets.editIcon,
          action: () => state.selectScreen(ProfileScreen.edit),
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
          Text(
            state.userName ?? AppStrings.nameFormFieldHint,
            style: MainUIConstants.headlineTextStyle,
            maxLines: 3,
            textAlign: TextAlign.center
          ),
          const Spacer(),
          SecondaryButton(label: AppStrings.logoutButton, icon: AppAssets.logoutIcon, onPressed: () {
            // TODO: logout
          })
        ],
      ),
    );
  }

  Widget _buildPhoto(String? photoUrl, Size screenSize) {
    return Container(
      decoration: const BoxDecoration(shape: BoxShape.circle),
      width: screenSize.width * ProfileUIConstants.avatarSizeCof,
      height: screenSize.width * ProfileUIConstants.avatarSizeCof,
      clipBehavior: Clip.hardEdge,
      child: photoUrl == null ? SvgPicture.asset(AppAssets.placeholderImage) : Image.network(photoUrl),
    );
  }
}
