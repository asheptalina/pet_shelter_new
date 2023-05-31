import 'package:flutter/material.dart';
import 'package:pet_shelter_new/consts/app_colors.dart';
import 'package:pet_shelter_new/ui_consts/main_ui_consts.dart';

class TopSnackBar extends StatelessWidget {

  final String text;
  final bool isError;

  const TopSnackBar({required this.text, this.isError = false, Key? key})
      : super(key: key);

  static const borderRadius = 8.0;
  static const internalPadding = 16.0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * MainUIConstants.horizontalPaddingCof
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: isError ? AppColors.error : AppColors.accent,
                  borderRadius: BorderRadius.circular(borderRadius),
                  boxShadow: [BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 2),
                      blurRadius: 6,
                      spreadRadius: 0
                  )]
              ),
              padding: const EdgeInsets.all(internalPadding),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                        text,
                        style: MainUIConstants.textStyleSize16Weight700
                            .copyWith(decoration: TextDecoration.none, color: Colors.white),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start
                    )
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
