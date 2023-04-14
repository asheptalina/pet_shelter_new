import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pet_shelter_new/states/create_ad/create_ad_state.dart';
import 'package:pet_shelter_new/views/create_ad/create_ad_add_photo_widget.dart';
import 'package:pet_shelter_new/views/create_ad/create_ad_description_widget.dart';
import 'package:pet_shelter_new/views/create_ad/create_ad_review_photo_widget.dart';
import 'package:pet_shelter_new/views/create_ad/create_ad_specify_address_widget.dart';
import 'package:provider/provider.dart';

class CreateAdContainerWidget extends StatelessWidget {
  const CreateAdContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createAdState = Provider.of<CreateAdState>(context);
    return Observer(builder: (_) => _buildContent(createAdState));
  }

  Widget _buildContent(CreateAdState state) {
    switch (state.selectedScreen) {
      case CreateAdScreen.addPhoto:
        return CreateAdAddPhotoWidget(state: state);
      case CreateAdScreen.reviewPhoto:
        return CreateAdReviewPhotoWidget(state: state);
      case CreateAdScreen.specifyAddress:
        return CreateAdSpecifyAddressWidget(state: state);
      case CreateAdScreen.addDescription:
        return CreateAdDescriptionWidget(state: state);
      default:
        return CreateAdAddPhotoWidget(state: state);
    }
  }
}
