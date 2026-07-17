import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_calorie_scanner/core/utils/colors/app_colors.dart';
import 'package:food_calorie_scanner/core/utils/styles/app_style.dart';
import 'package:food_calorie_scanner/core/utils/widgets/custom_elevated_button.dart';
import 'package:food_calorie_scanner/feature/scan_food/presentation/cubit/scan_meal_cubit/scan_meal_cubit.dart';
import 'package:food_calorie_scanner/feature/scan_food/presentation/widgets/scan_meal_result/macro_progress_card.dart';
import 'package:food_calorie_scanner/feature/scan_food/presentation/widgets/scan_meal_result/meal_result_header_image.dart';
import 'package:food_calorie_scanner/feature/scan_food/presentation/widgets/scan_meal_result/protine_segment_card.dart';
import 'package:food_calorie_scanner/feature/scan_food/presentation/widgets/scan_meal_result/total_calorie_card.dart';

class ScanMealResultViewBody extends StatelessWidget {
  const ScanMealResultViewBody({super.key});

  @override
  Widget build(BuildContext context) {
  final state = context.watch<ScanMealCubit>().state;

if (state is! ScanMealSuccess) {
  return const Center(child: CircularProgressIndicator());
}

final result = state.result;
final imageFile = state.imageFile;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MealHeaderImage(
            title: result.foodName,
            subtitle: 'Estimated portion detected',
            imageFile: imageFile,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                TotalCaloriesCard(
                  calories: result.calories,
                  dailyGoalPercent: result.calories / 2000,
                ),
                const SizedBox(height: 16),
                PortionDetailsCard(portionEstimate: result.portionEstimate),
                const SizedBox(height: 16),
                MacroProgressCard(
                  icon: Icons.bolt_rounded,
                  iconBackground: AppColors.proteinTrack,
                  iconColor: AppColors.proteinColor,
                  label: 'Protein',
                  value: result.proteinG,
                  unit: 'g',
                  progress: result.proteinG / 100,
                  progressColor: AppColors.proteinColor,
                  progressTrack: AppColors.proteinTrack,
                ),
                const SizedBox(height: 14),
                MacroProgressCard(
                  icon: Icons.grain_rounded,
                  iconBackground: AppColors.carbsTrack,
                  iconColor: AppColors.carbsColor,
                  label: 'Carbs',
                  value: result.carbsG,
                  unit: 'g',
                  progress: result.carbsG / 300,
                  progressColor: AppColors.carbsColor,
                  progressTrack: AppColors.carbsTrack,
                ),
                const SizedBox(height: 14),
                MacroProgressCard(
                  icon: Icons.water_drop_rounded,
                  iconBackground: AppColors.fatTrack,
                  iconColor: AppColors.fatColor,
                  label: 'Fat',
                  value: result.fatG,
                  unit: 'g',
                  progress: result.fatG / 70,
                  progressColor: AppColors.fatColor,
                  progressTrack: AppColors.fatTrack,
                ),
                const SizedBox(height: 24),
                CustomElevatedButton(
                  text: 'Scan Again',
                  onPressed: () => Navigator.pop(context),
                  backgroundColor: AppColors.primaryOrange,
                  foregroundColor: AppColors.cardBackground,
                  textStyle: AppStyle.text16.copyWith(
                    color: AppColors.cardBackground,
                  ),
                  radius: 26,
                  height: 54,
                  elevation: 0,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
