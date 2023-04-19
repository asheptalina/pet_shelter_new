import 'package:flutter/material.dart';
import 'package:pet_shelter_new/consts/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            CircularProgressIndicator(color: AppColors.primary)
          ]
        )
      ]
    );
  }
}