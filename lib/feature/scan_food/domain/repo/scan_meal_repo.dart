import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:food_calorie_scanner/core/utils/failure/failure.dart';
import 'package:food_calorie_scanner/feature/scan_food/domain/entity/scan_meal_entity.dart';

abstract class ScaMealRepo {
  Future<Either<Failure, ScanMealEntity>> scanMeal(File image);
}
