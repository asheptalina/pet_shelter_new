import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_shelter_new/consts/app_assets.dart';
import 'package:pet_shelter_new/consts/app_colors.dart';
import 'package:pet_shelter_new/ui_consts/main_ui_consts.dart';

class CustomAppBar extends StatelessWidget {

  final String? header;
  final VoidCallback? onBack;
  final String? actionIcon;
  final VoidCallback? action;

  const CustomAppBar({this.header, this.onBack, this.action, this.actionIcon, Key? key})
      : super(key: key);

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
              _buildHeader(),
              _buildActionButton()
            ]
          )
        )
      )
    );
  }

  Widget _buildBackButton() {
    return onBack == null ? const SizedBox.shrink() : Align(
      alignment: Alignment.bottomLeft,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onBack!(),
        child: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: SvgPicture.asset(AppAssets.backIcon, color: Colors.white)
        )
      ),
    );
  }

  Widget _buildHeader() {
    return header == null ? const SizedBox.shrink() : Align(
        alignment: Alignment.bottomCenter,
        child: Text(
            header!,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: MainUIConstants.textStyleSize20Weight700.copyWith(color: Colors.white)
        )
    );
  }

  Widget _buildActionButton() {
    return action == null || actionIcon == null ? const SizedBox.shrink() : Align(
      alignment: Alignment.bottomRight,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => action!(),
        child: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: SvgPicture.asset(actionIcon!, color: Colors.white)
        )
      ),
    );
  }
}
