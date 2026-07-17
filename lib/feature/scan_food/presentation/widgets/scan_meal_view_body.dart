import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_calorie_scanner/core/utils/helper/scan_meal_image.dart';
import 'package:food_calorie_scanner/feature/scan_food/presentation/scan_meal_result_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:food_calorie_scanner/feature/scan_food/presentation/cubit/scan_meal_cubit/scan_meal_cubit.dart';
import 'package:food_calorie_scanner/feature/scan_food/presentation/widgets/header_section.dart';
import 'package:food_calorie_scanner/feature/scan_food/presentation/widgets/scan_button.dart';
import 'package:food_calorie_scanner/core/utils/colors/app_colors.dart';
import 'package:food_calorie_scanner/core/utils/styles/app_style.dart';

class ScanMealViewBody extends StatefulWidget {
  const ScanMealViewBody({super.key});

  @override
  State<ScanMealViewBody> createState() => _ScanMealViewBodyState();
}

class _ScanMealViewBodyState extends State<ScanMealViewBody>
    with SingleTickerProviderStateMixin {
  File? _pickedImage;
  late final AnimationController _scanController;

  static const double _imageSize = 220;

  @override
  void initState() {
    super.initState();
    _scanController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _scanController.dispose();
    super.dispose();
  }

  Future<void> _handleImageSelected(ImageSource source) async {
    final file = await ScanMealImagePickerHelper.pickImage(context, source);
    if (file != null && context.mounted) {
      setState(() => _pickedImage = file);
      context.read<ScanMealCubit>().scanMeal(file);
    }
  }

  Future<void> _navigateToResult(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<ScanMealCubit>(),
          child: const ScanMealResultView(),
        ),
      ),
    );

    if (mounted) {
      setState(() => _pickedImage = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScanMealCubit, ScanMealState>(
      listener: (context, state) {
        if (state is ScanMealSuccess) {
          _navigateToResult(context);
        } else if (state is ScanMealFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        final isLoading = state is ScanMealLoading;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const HeaderSection(),
            const Spacer(),
            Center(
              child: _pickedImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: _imageSize,
                        height: _imageSize,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.file(_pickedImage!, fit: BoxFit.cover),
                            if (isLoading) ...[
                              Container(color: Colors.black.withOpacity(0.25)),
                              AnimatedBuilder(
                                animation: _scanController,
                                builder: (context, child) {
                                  return Positioned(
                                    top:
                                        _scanController.value *
                                        (_imageSize - 3),
                                    left: 0,
                                    right: 0,
                                    child: child!,
                                  );
                                },
                                child: Container(
                                  height: 3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.primaryOrange
                                            .withOpacity(0.9),
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.transparent,
                                        AppColors.primaryOrange,
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    )
                  : ScanButton(
                      onTap: () =>
                          ScanMealImagePickerHelper.showImageSourceSheet(
                            context,
                            onSourceSelected: _handleImageSelected,
                          ),
                    ),
            ),
            const SizedBox(height: 18),
            Center(
              child: Text(
                isLoading
                    ? 'Analyzing your meal...'
                    : (_pickedImage != null
                          ? 'Photo selected'
                          : 'Tap to scan food'),
                style: AppStyle.text16.copyWith(color: AppColors.primaryOrange),
              ),
            ),
            const Spacer(),
            const SizedBox(height: 50),
          ],
        );
      },
    );
  }
}