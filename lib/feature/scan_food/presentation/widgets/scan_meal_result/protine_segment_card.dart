
import 'package:flutter/material.dart';
import 'package:food_calorie_scanner/core/utils/colors/app_colors.dart';
import 'package:food_calorie_scanner/core/utils/styles/app_style.dart';

class PortionDetailsCard extends StatelessWidget {
  final String portionEstimate;

  const PortionDetailsCard({super.key, required this.portionEstimate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.accentGreen.withOpacity(0.12),
            child: Icon(
              Icons.restaurant_rounded,
              color: AppColors.accentGreen,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PORTION ESTIMATE',
                  style: AppStyle.text16.copyWith(
                    color: AppColors.textLabel,
                    fontSize: 12,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  portionEstimate,
                  style: AppStyle.text16.copyWith(
                    color: AppColors.textPrimary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
