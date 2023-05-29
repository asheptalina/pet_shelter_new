import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_shelter_new/consts/app_assets.dart';
import 'package:pet_shelter_new/consts/app_colors.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';
import 'package:pet_shelter_new/states/app_state/app_state.dart';
import 'package:pet_shelter_new/states/profile/profile_state.dart';
import 'package:pet_shelter_new/ui_consts/main_ui_consts.dart';
import 'package:pet_shelter_new/ui_consts/profile_ui_consts.dart';
import 'package:pet_shelter_new/views/components/alert_widget.dart';
import 'package:pet_shelter_new/views/components/custom_app_bar.dart';
import 'package:pet_shelter_new/views/components/custom_form_field.dart';
import 'package:pet_shelter_new/views/components/primary_button.dart';
import 'package:pet_shelter_new/views/components/secondary_button.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

class ProfileEditWidget extends StatefulWidget {
  const ProfileEditWidget({Key? key}) : super(key: key);

  @override
  State<ProfileEditWidget> createState() => _ProfileEditWidgetState();
}

class _ProfileEditWidgetState extends State<ProfileEditWidget> {
  bool _showSaveAlert = false;

  @override
  Widget build(BuildContext context) {
    final ProfileState state = Provider.of<ProfileState>(context);
    return Stack(
      children: [
        Opacity(
          opacity: _showSaveAlert ? 0.4 : 1,
          child: Column(
            children: [
              CustomAppBar(
                  header: AppStrings.profileEditing,
                  onBack: () {
                    Routemaster.of(context).history.back();
                    state.clearChanges();
                  }
              ),
              Expanded(child: _buildContent(context, state))
            ],
          )
        ),
        _buildSaveAlert(state)
      ],
    );
  }

  Widget _buildContent(BuildContext context, ProfileState state) {
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
              child: _buildPhoto(context, state.currentAvatarUrl ?? state.avatarUrl, screenSize)
          ),
          CustomFormField(
              value: state.userName,
              labelText: AppStrings.nameFormFieldHint,
              onChanged: (value) => state.onUserNameChanged(value)
          ),
          const Spacer(),
          PrimaryButton(
              label: AppStrings.saveButton,
              onPressed: () {
                if (state.hasChanges) {
                  setState(() => _showSaveAlert = true);
                }
              }
          )
        ],
      ),
    );
  }

  Widget _buildPhoto(BuildContext context, String? photoUrl, Size screenSize) {
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
            child: photoUrl == null ? SvgPicture.asset(AppAssets.placeholderImage) : Image.network(
              photoUrl,
              fit: BoxFit.cover,
              loadingBuilder: (_, child, loadingProgress) => loadingProgress == null
                  ? child
                  : SvgPicture.asset(AppAssets.placeholderImage),
              errorBuilder: (context, err, _) => SvgPicture.asset(AppAssets.placeholderImage),
            )
          )
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(left: avatarSize - ProfileUIConstants.addPhotoButtonSize),
            child: _buildAddPhotoButton(context)
          ),
        )
      ],
    );
  }

  Widget _buildAddPhotoButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Routemaster.of(context).push('photo'),
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

  Widget _buildSaveAlert(ProfileState state) {
    final AppState appState = Provider.of<AppState>(context);
    return _showSaveAlert ? AlertWidget(
        title: AppStrings.saveAlert,
        actions: [
          SecondaryButton(
              label: AppStrings.doNotSaveButton,
              onPressed: () => setState(() => _showSaveAlert = false)
          ),
          PrimaryButton(label: AppStrings.saveButton, onPressed: () {
            setState(() => _showSaveAlert = false);
            state.save(
              () {
                Routemaster.of(context).replace('/profile');
                state.clearChanges();
              },
              appState.logout
            );
          })
        ]
    ) : const SizedBox.shrink();
  }
}
