import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pet_shelter_new/states/profile/profile_state.dart';
import 'package:pet_shelter_new/views/profile/profile_edit_widget.dart';
import 'package:pet_shelter_new/views/profile/profile_view_widget.dart';

class ProfileContainerWidget extends StatelessWidget {
  const ProfileContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileState = ProfileState();
    return Observer(builder: (_) => _buildContent(profileState));
  }

  Widget _buildContent(ProfileState state) {
    switch (state.selectedScreen) {
      case ProfileScreen.view:
        return ProfileViewWidget(state: state);
      case ProfileScreen.edit:
        return ProfileEditWidget(state: state);
    }
  }
}
