import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_shelter_new/consts/app_assets.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';
import 'package:pet_shelter_new/states/app_state/app_state.dart';
import 'package:pet_shelter_new/states/profile/profile_state.dart';
import 'package:pet_shelter_new/ui_consts/main_ui_consts.dart';
import 'package:pet_shelter_new/ui_consts/profile_ui_consts.dart';
import 'package:pet_shelter_new/views/components/custom_app_bar.dart';
import 'package:pet_shelter_new/views/components/secondary_button.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

class ProfileViewWidget extends StatelessWidget {

  const ProfileViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          actionIcon: AppAssets.editIcon,
          action: () => Routemaster.of(context).push('edit'),
        ),
        Expanded(child: _buildContent(context))
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final ProfileState state = Provider.of<ProfileState>(context);
    final AppState appState = Provider.of<AppState>(context);
    state.getUserInfo(appState.logout);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MainUIConstants.verticalPadding,
        horizontal: screenSize.width * MainUIConstants.horizontalPaddingCof
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: MainUIConstants.formFieldVerticalSpacing),
            child:  Observer(builder: (_) => _buildPhoto(state.avatarUrl, screenSize))
          ),
          Observer(builder: (_) => Text(
              state.userName ?? AppStrings.nameFormFieldHint,
              style: MainUIConstants.headlineTextStyle,
              maxLines: 3,
              textAlign: TextAlign.center
          )),
          const Spacer(),
          SecondaryButton(
            label: AppStrings.logoutButton,
            icon: AppAssets.logoutIcon,
            onPressed: appState.logout
          )
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
      child: photoUrl == null ? SvgPicture.asset(AppAssets.placeholderImage) : Image.network(
        photoUrl,
        fit: BoxFit.fill,
        loadingBuilder: (_, child, loadingProgress) => loadingProgress == null
            ? child
            : SvgPicture.asset(AppAssets.placeholderImage),
        errorBuilder: (context, err, _) => SvgPicture.asset(AppAssets.placeholderImage),
      )
    );
  }
}
