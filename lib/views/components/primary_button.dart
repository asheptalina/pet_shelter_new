import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_shelter_new/ui_consts/main_ui_consts.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final String? icon;
  final bool iconLeading;
  final VoidCallback onPressed;

  const PrimaryButton({
    required this.label,
    this.icon,
    this.iconLeading = true,
    required this.onPressed,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: onPressed,
      style: MainUIConstants.primaryButtonStyle,
      child: icon == null ? Text(label) : Wrap(
        spacing: MainUIConstants.buttonInnerHorizontalPadding,
        children: iconLeading
            ? [SvgPicture.asset(icon!, color: Colors.white), Text(label)]
            : [Text(label), SvgPicture.asset(icon!, color: Colors.white)],
      ),
    );
  }
}
