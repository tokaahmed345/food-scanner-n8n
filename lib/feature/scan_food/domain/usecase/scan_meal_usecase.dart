import 'dart:io';

import 'package:food_calorie_scanner/core/utils/failure/failure.dart';
import 'package:food_calorie_scanner/feature/scan_food/domain/entity/scan_meal_entity.dart';
import 'package:food_calorie_scanner/feature/scan_food/domain/repo/scan_meal_repo.dart';
import 'package:dartz/dartz.dart';

class ScanMealUsecase {
  final ScaMealRepo repo;

  ScanMealUsecase({required this.repo});

  Future<Either<Failure, ScanMealEntity>> call(File image) async {
 return   await repo.scanMeal(image);
  }
}
