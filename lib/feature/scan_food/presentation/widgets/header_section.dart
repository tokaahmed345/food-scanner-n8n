import 'package:flutter/material.dart';
import 'package:food_calorie_scanner/core/utils/colors/app_colors.dart';
import 'package:food_calorie_scanner/core/utils/styles/app_style.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.eco_rounded,
              color: AppColors.accentGreen,
              size: 18,
            ),
            const SizedBox(width: 6),
            Text(
              'CalorieLens',
              style: AppStyle.text18.copyWith(color: AppColors.accentGreen),
            ),
          ],
        ),
        const SizedBox(height: 8),

        RichText(
          text: TextSpan(
            style: AppStyle.text28.copyWith(color: AppColors.textPrimary),
            children: [
              const TextSpan(text: 'Snap Your\n'),
              TextSpan(
                text: 'Meal',
                style: TextStyle(color: AppColors.primaryOrange),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),

        Text(
          'Get instant nutrition info',
          style: AppStyle.text16.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
