import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_shelter_new/consts/app_assets.dart';
import 'package:pet_shelter_new/consts/app_colors.dart';
import 'package:pet_shelter_new/ui_consts/main_ui_consts.dart';

class CustomAppBar extends StatelessWidget {

  final String header;
  final VoidCallback? onBack;

  const CustomAppBar({required this.header, this.onBack, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width,
      height: screenSize.height * MainUIConstants.appBarHeightCof,
      child: Container(
        color: AppColors.primary,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              _buildBackButton(),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(header, style: MainUIConstants.headerTextStyle)
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return onBack == null ? const SizedBox.shrink() : Align(
      alignment: Alignment.bottomLeft,
      child: GestureDetector(
        onTap: () => onBack!(),
        child: SvgPicture.asset(AppAssets.backIcon),
      ),
    );
  }
}
