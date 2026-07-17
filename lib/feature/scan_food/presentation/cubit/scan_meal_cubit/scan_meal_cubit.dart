import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entity/scan_meal_entity.dart';
import '../../../domain/usecase/scan_meal_usecase.dart';

part 'scan_meal_state.dart';

class ScanMealCubit extends Cubit<ScanMealState> {
  final ScanMealUsecase scanMealUsecase;
  ScanMealCubit(this.scanMealUsecase) : super(const ScanMealInitial());

  Future<void> scanMeal(File imageFile) async {
    emit(const ScanMealLoading());
    final result = await scanMealUsecase(imageFile);
    result.fold(
      (failure) => emit(ScanMealFailure(failure.message)),
      (mealResult) => emit(
        ScanMealSuccess(result: mealResult, imageFile: imageFile),
      ),
    );
  }
}