import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_shelter_new/ui_consts/main_ui_consts.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final String? icon;
  final bool iconLeading;
  final double? width;
  final VoidCallback? onPressed;

  const PrimaryButton({
    required this.label,
    this.icon,
    this.iconLeading = true,
    this.width,
    required this.onPressed,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: MainUIConstants.primaryButtonStyle,
      child: width == null ? _buildContent() : SizedBox(width: width, child: Center(child: _buildContent())),
    );
  }

  Widget _buildContent() {
    return icon == null ? Text(label) : Wrap(
      spacing: MainUIConstants.buttonInnerHorizontalPadding,
      crossAxisAlignment: WrapCrossAlignment.end,
      children: iconLeading
          ? [SvgPicture.asset(icon!, color: Colors.white), Text(label)]
          : [Text(label), SvgPicture.asset(icon!, color: Colors.white)],
    );
  }
}
