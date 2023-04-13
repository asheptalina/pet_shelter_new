import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_shelter_new/consts/app_assets.dart';
import 'package:pet_shelter_new/consts/app_colors.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';
import 'package:pet_shelter_new/models/pet_type.dart';
import 'package:pet_shelter_new/states/create_ad/create_ad_state.dart';
import 'package:pet_shelter_new/ui_consts/main_ui_consts.dart';
import 'package:pet_shelter_new/views/components/custom_app_bar.dart';
import 'package:pet_shelter_new/views/components/custom_form_field.dart';
import 'package:pet_shelter_new/views/components/primary_button.dart';

class CreateAdDescriptionWidget extends StatelessWidget {

  final CreateAdState state;

  const CreateAdDescriptionWidget({required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          CustomAppBar(
              header: AppStrings.specifyAddressButton,
              onBack: () => state.selectScreen(CreateAdScreen.specifyAddress)
          ),
          Expanded(
            child: Observer(
              builder: (_) => _buildContent(context),
            )
          )
        ]
    );
  }

  Widget _buildContent(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        left: screenSize.width * MainUIConstants.horizontalPaddingCof,
        right: screenSize.width * MainUIConstants.horizontalPaddingCof,
        bottom: screenSize.height * MainUIConstants.bottomButtonPaddingCof
      ),
      child: Column(
        children: [
          _buildPetTypeSelectors(screenSize),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: _buildTitleTextField()
          ),
          Expanded(child: _buildDescriptionTextField()),
          const Spacer(),
          _buildCreateButton()
        ],
      ),
    );
  }

  Widget _buildTitleTextField() {
    return CustomFormField(
      labelText: AppStrings.adTitleHint,
      onChanged: (value) => state.onTitleChanged(value),
      errorText: state.titleError,
    );
  }

  Widget _buildDescriptionTextField() {
    return CustomFormField(
      labelText: AppStrings.petDescriptionHint,
      onChanged: (value) => state.onDescriptionChanged(value),
      errorText: state.descriptionError,
      maxLines: 10,
    );
  }

  Widget _buildCreateButton() {
    return PrimaryButton(label: AppStrings.createAdButton, onPressed: () => state.createAd());
  }

  Widget _buildPetTypeSelectors(Size screenSize) {
    return GridView.builder(
      shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: PetType.values.length,
          crossAxisSpacing: 12
        ),
        itemCount: PetType.values.length,
        itemBuilder: (context, index) =>
          GestureDetector(
            onTap: () => state.selectPetType(PetType.values[index]),
            child: _buildPetTypeItem(
              PetType.values[index],
              state.petType == PetType.values[index],
              screenSize
            ),
          )
    );
  }

  Widget _buildPetTypeItem(PetType petType, bool selected, Size screenSize) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? AppColors.accent : Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6, spreadRadius: 2)]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            petType.getIconName(),
            color: selected ? Colors.white : AppColors.primary,
            width: screenSize.width * 0.16
          ),
          Text(petType.getDisplayName(), style: TextStyle( // TODO: move text style
              fontFamily: AppAssets.mulishFontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: selected ? Colors.white : AppColors.primary
          ))
        ],
      ),
    );
  }
}
