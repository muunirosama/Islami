import 'package:flutter/material.dart';
import 'package:islami/cores/themes/app_colors.dart';
import 'package:islami/feautures/onboarding/models/on-boardingmodel.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel onboardingModel;
   OnboardingItem({super.key, required this.onboardingModel, });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          onboardingModel.imagePath
        ),
        Text(
          onboardingModel.title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: AppColors.primaryColor
          ),
        ),
        Text(
          onboardingModel.desc??"",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: AppColors.primaryColor
          ),
        )
      ],
    );
  }
}
