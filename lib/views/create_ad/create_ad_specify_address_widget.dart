import 'package:flutter/material.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';
import 'package:pet_shelter_new/models/geo_coordinate.dart';
import 'package:pet_shelter_new/states/create_ad/create_ad_state.dart';
import 'package:pet_shelter_new/views/components/custom_app_bar.dart';
import 'package:pet_shelter_new/views/components/primary_button.dart';

class CreateAdSpecifyAddressWidget extends StatelessWidget {

  final CreateAdState state;

  const CreateAdSpecifyAddressWidget({required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
            header: AppStrings.specifyAddressButton,
            onBack: () => state.selectScreen(CreateAdScreen.reviewPhoto)
        ),
        Expanded(child: _buildContent(context))
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        _buildMap(),
        Padding(
          padding: EdgeInsets.only(top: 16, bottom: 24),
          child: Column(
            children: [
              const Spacer(),
              PrimaryButton(
                  label: AppStrings.specifyAddressButton,
                  onPressed: () {
                    state.saveGeoCoordinate(GeoCoordinate(55, 73));
                    state.selectScreen(CreateAdScreen.addDescription);
                  }
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildMap() {
    // return SimpleOSM();
    // TODO: add Map
    return const SizedBox.shrink();
  }
}
