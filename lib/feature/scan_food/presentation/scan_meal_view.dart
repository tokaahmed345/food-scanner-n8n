import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_calorie_scanner/core/utils/service_locator/service_locator.dart';
import 'package:food_calorie_scanner/feature/scan_food/presentation/cubit/scan_meal_cubit/scan_meal_cubit.dart';
import 'package:food_calorie_scanner/feature/scan_food/presentation/widgets/scan_meal_view_body.dart';
import 'package:food_calorie_scanner/core/utils/colors/app_colors.dart';

class ScanMealView extends StatelessWidget {
  const ScanMealView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocProvider(
            create: (context) => getIt.get<ScanMealCubit>(),
            child: ScanMealViewBody(),
          ),
        ),
      ),
    );
  }
}
