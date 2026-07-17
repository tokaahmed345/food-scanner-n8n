import 'package:flutter/material.dart';
import 'package:food_calorie_scanner/core/utils/colors/app_colors.dart';
import 'package:food_calorie_scanner/core/utils/styles/app_style.dart';

class CalorieCircleIndicator extends StatelessWidget {
  final int calories;
  final double size;

  const CalorieCircleIndicator({
    super.key,
    required this.calories,
    this.size = 84,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: 1,
              strokeWidth: 7,
              strokeCap: StrokeCap.round,
              valueColor: const AlwaysStoppedAnimation(
                AppColors.progressTrack,
              ),
            ),
          ),
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: 0.7,
              strokeWidth: 7,
              strokeCap: StrokeCap.round,
              valueColor: const AlwaysStoppedAnimation(
                AppColors.primaryOrange,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$calories',
                style: AppStyle.text18.copyWith(color: AppColors.textPrimary),
              ),
              Text(
                'kcal',
                style: AppStyle.text16.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
