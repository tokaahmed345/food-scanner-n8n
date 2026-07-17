import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:food_calorie_scanner/core/utils/failure/failure.dart';
import 'package:food_calorie_scanner/core/utils/failure/server_failure.dart';
import 'package:food_calorie_scanner/feature/scan_food/data/data_source/scan_meal_remote_data_source.dart';
import 'package:food_calorie_scanner/feature/scan_food/domain/entity/scan_meal_entity.dart';
import 'package:food_calorie_scanner/feature/scan_food/domain/repo/scan_meal_repo.dart';

class ScanMealRepoImpl implements ScaMealRepo {
  final ScanMealRemoteDataSource scanMNeal;

  ScanMealRepoImpl({required this.scanMNeal});
  @override
  Future<Either<Failure, ScanMealEntity>> scanMeal(File image) async {
    try {
      final result = await scanMNeal.scanMeal(image);
      return right(result);
    } on CustomException catch (e) {
      return left(Failure(e.message));

    }catch(e){
         return left(Failure(e.toString()));
   
    }
  }
}
