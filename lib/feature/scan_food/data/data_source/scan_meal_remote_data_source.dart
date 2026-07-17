import 'dart:convert';
import 'dart:io';
import 'package:food_calorie_scanner/core/utils/constant/endpoints.dart';
import 'package:food_calorie_scanner/core/utils/service/api_service.dart';
import 'package:food_calorie_scanner/feature/scan_food/data/models/scan_meal_model.dart';

class ScanMealRemoteDataSource {
  final ApiService apiService;

  ScanMealRemoteDataSource({required this.apiService});
  Future< ScanMealModel> scanMeal(File image) async {
    final bytes = await image.readAsBytes();
    final base64Image = base64Encode(bytes);
    final response = await apiService.post(
      EndPoints.scan,
      data: {'image': base64Image},
    );
    return ScanMealModel.fromJson(response);
  }
}
