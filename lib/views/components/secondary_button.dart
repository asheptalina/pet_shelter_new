import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_shelter_new/consts/app_colors.dart';
import 'package:pet_shelter_new/ui_consts/main_ui_consts.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final String? icon;
  final bool iconLeading;
  final VoidCallback onPressed;

  const SecondaryButton({
    required this.label,
    this.icon,
    this.iconLeading = true,
    required this.onPressed,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: MainUIConstants.secondaryButtonStyle,
      child: icon == null ? Text(label) : Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        spacing: MainUIConstants.buttonInnerHorizontalPadding,
        children: iconLeading
            ? [SvgPicture.asset(icon!, color: AppColors.black), Text(label)]
            : [Text(label), SvgPicture.asset(icon!, color: AppColors.black)],
      ),
    );
  }
}
