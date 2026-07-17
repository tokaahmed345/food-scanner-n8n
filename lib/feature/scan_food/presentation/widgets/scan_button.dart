
import 'package:flutter/material.dart';
import 'package:food_calorie_scanner/core/utils/colors/app_colors.dart';

class ScanButton extends StatelessWidget {
  final VoidCallback onTap;

  const ScanButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 230,
        height: 230,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [AppColors.glowOrangeLight, Colors.transparent],
            stops: [0.4, 1],
          ),
        ),
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryOrange,
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryOrange.withOpacity(0.35),
                blurRadius: 50,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child:  Icon(
            Icons.camera_alt_rounded,
            color: AppColors.cardBackground,
            size: 60,
          ),
        ),
      ),
    );
  }
}