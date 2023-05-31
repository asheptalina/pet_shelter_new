import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';
import 'package:pet_shelter_new/states/profile/profile_state.dart';
import 'package:pet_shelter_new/views/components/add_photo_widget.dart';
import 'package:pet_shelter_new/views/components/top_snackbar.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

class ProfileAddPhotoWidget extends StatelessWidget {

  const ProfileAddPhotoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileState state = Provider.of<ProfileState>(context);
    return AddPhotoWidget(
        onSuccess: (file) {
          state.savePhoto(
              file,
              () => Routemaster.of(context).history.back(),
              () {
                showOverlay((context, t) {
                  return const TopSnackBar(text: AppStrings.profileSaveErrorAlert, isError: true);
                });
                Routemaster.of(context).history.back();
              }
          );
        },
        onBack: () => Routemaster.of(context).history.back()
    );
  }
}
