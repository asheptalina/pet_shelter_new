import 'package:flutter/material.dart';
import 'package:pet_shelter_new/consts/app_assets.dart';
import 'package:pet_shelter_new/consts/app_colors.dart';

class MainUIConstants {
  static const verticalPadding = 24.0;
  static const horizontalPaddingCof = 0.085;
  static const bottomButtonPaddingCof = 0.06;

  static const buttonPaddings = EdgeInsets.symmetric(vertical: 18.5, horizontal: 32);
  static const buttonInnerHorizontalPadding = 11.0;

  static const formFieldVerticalSpacing = 32.0;

  static const appBarHeightCof = 0.133;

  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      padding: buttonPaddings,
      textStyle: textStyleSize16Weight700.copyWith(color: Colors.white),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))
      )
  );

  static ButtonStyle secondaryButtonStyle = TextButton.styleFrom(
      foregroundColor: AppColors.black,
      padding: buttonPaddings,
      textStyle: textStyleSize16Weight700
  );

  static const textStyleSize24Weight700 = TextStyle(
      fontFamily: AppAssets.mulishFontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.black
  );

  static const textStyleSize20Weight700 = TextStyle(
      fontFamily: AppAssets.mulishFontFamily,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.black
  );

  static const textStyleSize16Weight700 = TextStyle(
      fontFamily: AppAssets.mulishFontFamily,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColors.black
  );

  static const textStyleSize16Weight400 = TextStyle(
      fontFamily: AppAssets.mulishFontFamily,
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.black
  );

  static const textStyleSize12Weight400 = TextStyle(
      fontFamily: AppAssets.mulishFontFamily,
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: AppColors.black
  );

  static const textStyleSize14Weight600 = TextStyle(
      fontFamily: AppAssets.mulishFontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.black
  );

  static TextStyle errorTextStyle = textStyleSize12Weight400.copyWith(color: AppColors.error);
}