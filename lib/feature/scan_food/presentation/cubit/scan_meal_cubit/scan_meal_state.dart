part of 'scan_meal_cubit.dart';

abstract class ScanMealState extends Equatable {
  const ScanMealState();

  @override
  List<Object?> get props => [];
}

class ScanMealInitial extends ScanMealState {
  const ScanMealInitial();
}

class ScanMealLoading extends ScanMealState {
  const ScanMealLoading();
}

class ScanMealSuccess extends ScanMealState {
  final ScanMealEntity result;
  final File imageFile;

  const ScanMealSuccess({required this.result, required this.imageFile});

  @override
  List<Object?> get props => [result, imageFile];
}

class ScanMealFailure extends ScanMealState {
  final String message;

  const ScanMealFailure(this.message);

  @override
  List<Object?> get props => [message];
}