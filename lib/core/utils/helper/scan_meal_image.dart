import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:food_calorie_scanner/core/utils/colors/app_colors.dart';

class ScanMealImagePickerHelper {
  ScanMealImagePickerHelper._();

  static Future<File?> pickImage(
    BuildContext context,
    ImageSource source,
  ) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: source,
      imageQuality: 80,
    );

    if (pickedFile != null && context.mounted) {
      return File(pickedFile.path);
    }
    return null;
  }

  static void showImageSourceSheet(
    BuildContext context, {
    required void Function(ImageSource source) onSourceSelected,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.cardBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt_rounded),
                title: const Text('Take a photo'),
                onTap: () {
                  Navigator.pop(sheetContext);
                  onSourceSelected(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library_rounded),
                title: const Text('Choose from gallery'),
                onTap: () {
                  Navigator.pop(sheetContext);
                  onSourceSelected(ImageSource.gallery);
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}