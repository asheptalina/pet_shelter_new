import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_shelter_new/consts/app_assets.dart';
import 'package:pet_shelter_new/consts/app_colors.dart';
import 'package:pet_shelter_new/consts/app_types.dart';
import 'package:pet_shelter_new/ui_consts/main_ui_consts.dart';

class CustomFormField extends StatefulWidget {
  final String? value;
  final String labelText;
  final StringCallback onChanged;
  final bool obscureText;
  final String? errorText;
  final TextInputType inputType;
  final int maxLines;

  const CustomFormField({
    this.value,
    required this.labelText,
    required this.onChanged,
    this.obscureText = false,
    this.errorText,
    this.inputType = TextInputType.text,
    this.maxLines = 1,
    Key? key
  }) : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return
      Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 1),
            blurRadius: 10,
            spreadRadius: 2
        )
      ]),
      child: TextFormField(
        initialValue: widget.value,
        decoration: InputDecoration(
            hintText: widget.labelText,
            labelStyle: const TextStyle(
              fontFamily: AppAssets.mulishFontFamily,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: AppColors.hintText,
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: widget.errorText == null
                    ? BorderSide.none
                    : const BorderSide(color: AppColors.error, width: 2)
            ),
            errorText: widget.errorText,
            errorStyle: MainUIConstants.errorTextStyle,
            suffixIcon: widget.obscureText ? IconButton(
              icon: SvgPicture.asset(AppAssets.hidePasswordIcon),
              onPressed: () {
                _toggleObscure();
              },
            ) : const SizedBox.shrink()
        ),
        obscureText: widget.obscureText && _obscure,
        onChanged: widget.onChanged,
        keyboardType: widget.inputType,
        maxLines: widget.maxLines,
      ),
    );
  }

  void _toggleObscure() {
    setState(() {
      _obscure = !_obscure;
    });
  }
}