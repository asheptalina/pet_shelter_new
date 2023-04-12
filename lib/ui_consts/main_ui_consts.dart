import 'package:flutter/material.dart';
import 'package:pet_shelter_new/consts/app_assets.dart';
import 'package:pet_shelter_new/consts/app_colors.dart';

class MainUIConstants {
  static const horizontalPaddingCof = 0.085;
  static const bottomButtonPaddingCof = 0.06;

  static const buttonPaddings = EdgeInsets.symmetric(vertical: 18.5, horizontal: 32);
  static const buttonInnerHorizontalPadding = 11.0;

  static const appBarHeightCof = 0.133;

  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      padding: buttonPaddings,
      textStyle: primaryButtonsTextStyle.copyWith(color: Colors.white),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))
      )
  );

  static ButtonStyle secondaryButtonStyle = TextButton.styleFrom(
      foregroundColor: AppColors.black,
      padding: buttonPaddings,
      textStyle: secondaryButtonsTextStyle
  );

  static TextStyle headerTextStyle = const TextStyle(
      fontFamily: AppAssets.mulishFontFamily,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.black
  );

  static TextStyle primaryButtonsTextStyle = const TextStyle(
      fontFamily: AppAssets.mulishFontFamily,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColors.black
  );

  static TextStyle secondaryButtonsTextStyle = const TextStyle(
      fontFamily: AppAssets.mulishFontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.black
  );

  static TextStyle bodyTextStyle = const TextStyle(
      fontFamily: AppAssets.mulishFontFamily,
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.black
  );

  static TextStyle validationTextStyle = const TextStyle(
      fontFamily: AppAssets.mulishFontFamily,
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: AppColors.black
  );

  static TextStyle errorTextStyle = validationTextStyle.copyWith(color: AppColors.error);
}