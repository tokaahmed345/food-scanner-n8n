import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_calorie_scanner/core/utils/colors/app_colors.dart';
import 'package:food_calorie_scanner/core/utils/styles/app_style.dart';

class MealHeaderImage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imageUrl;
  final File? imageFile;

  const MealHeaderImage({
    super.key,
    required this.title,
    required this.subtitle,
    this.imageUrl,
    this.imageFile,
  });

  DecorationImage? get _backgroundImage {
    if (imageFile != null) {
      return DecorationImage(image: FileImage(imageFile!), fit: BoxFit.cover);
    }
    if (imageUrl != null) {
      return DecorationImage(image: NetworkImage(imageUrl!), fit: BoxFit.cover);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
        color: AppColors.textLabel,
        image: _backgroundImage,
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(28),
            bottomRight: Radius.circular(28),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, AppColors.overlayDark],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyle.text20.copyWith(color: AppColors.cardBackground),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: AppStyle.text16.copyWith(
                color: AppColors.cardBackground.withOpacity(0.85),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}