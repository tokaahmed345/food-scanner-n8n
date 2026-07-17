import 'package:flutter/material.dart';
import 'package:food_calorie_scanner/core/utils/colors/app_colors.dart';
import 'package:food_calorie_scanner/core/utils/styles/app_style.dart';
import 'package:food_calorie_scanner/feature/scan_food/presentation/widgets/scan_meal_result/calorie_circle_indicator.dart';

class TotalCaloriesCard extends StatelessWidget {
  final int calories;
  final double dailyGoalPercent;

  const TotalCaloriesCard({
    super.key,
    required this.calories,
    required this.dailyGoalPercent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TOTAL CALORIES',
            style: AppStyle.text16.copyWith(
              color: AppColors.textLabel,
              fontSize: 12,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              CalorieCircleIndicator(calories: calories),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: AppStyle.text28.copyWith(
                          color: AppColors.textPrimary,
                        ),
                        children: [
                          TextSpan(text: '$calories'),
                          TextSpan(
                            text: ' kcal',
                            style: AppStyle.text16.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${(dailyGoalPercent * 100).round()}% of daily goal',
                      style: AppStyle.text16.copyWith(
                        color: AppColors.accentGreen,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: LinearProgressIndicator(
                        value: dailyGoalPercent,
                        minHeight: 6,
                        backgroundColor: AppColors.progressTrack,
                        valueColor: const AlwaysStoppedAnimation(
                          AppColors.primaryOrange,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
