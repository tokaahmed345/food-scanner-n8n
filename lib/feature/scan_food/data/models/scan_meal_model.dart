
import 'package:food_calorie_scanner/feature/scan_food/domain/entity/scan_meal_entity.dart';

class ScanMealModel extends ScanMealEntity {
   ScanMealModel({
    required super.foodName,
    required super.calories,
    required super.proteinG,
    required super.carbsG,
    required super.fatG,
    required super.portionEstimate,
  });

  factory ScanMealModel.fromJson(Map<String, dynamic> json) {
    return ScanMealModel(
      foodName: json['food_name'] ?? 'Unknown',
      calories: json['calories'] ?? 0,
      proteinG: json['protein_g'] ?? 0,
      carbsG: json['carbs_g'] ?? 0,
      fatG: json['fat_g'] ?? 0,
      portionEstimate: json['portion_estimate'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'food_name': foodName,
      'calories': calories,
      'protein_g': proteinG,
      'carbs_g': carbsG,
      'fat_g': fatG,
      'portion_estimate': portionEstimate,
    };
  }
}