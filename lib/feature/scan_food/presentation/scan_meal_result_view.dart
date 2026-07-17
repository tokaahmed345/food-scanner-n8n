import 'package:flutter/material.dart';
import 'package:food_calorie_scanner/core/utils/colors/app_colors.dart';
import 'package:food_calorie_scanner/feature/scan_food/presentation/widgets/scan_meal_result/scan_meal_result_view_body.dart';

class ScanMealResultView extends StatelessWidget {
  const ScanMealResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        bottom: false,
        child: ScanMealResultViewBody(),
      ),
    );
  }
}
