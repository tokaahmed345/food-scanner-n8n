import 'package:dio/dio.dart';
import 'package:food_calorie_scanner/core/utils/service/api_service.dart';
import 'package:food_calorie_scanner/core/utils/service/dio_consumer.dart';
import 'package:food_calorie_scanner/feature/scan_food/data/data_source/scan_meal_remote_data_source.dart';
import 'package:food_calorie_scanner/feature/scan_food/data/repo_impl/scan_meal_repo_impl.dart';
import 'package:food_calorie_scanner/feature/scan_food/domain/repo/scan_meal_repo.dart';
import 'package:food_calorie_scanner/feature/scan_food/domain/usecase/scan_meal_usecase.dart';
import 'package:food_calorie_scanner/feature/scan_food/presentation/cubit/scan_meal_cubit/scan_meal_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiService>(() => DioConsumer(dio: getIt<Dio>()));

  getIt.registerLazySingleton<ScanMealRemoteDataSource>(
    () => ScanMealRemoteDataSource(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<ScaMealRepo>(
    () => ScanMealRepoImpl(scanMNeal: getIt<ScanMealRemoteDataSource>()),
  );

  getIt.registerLazySingleton<ScanMealUsecase>(
    () => ScanMealUsecase(repo: getIt<ScaMealRepo>()),
  );

  getIt.registerFactory<ScanMealCubit>(
    () => ScanMealCubit(getIt<ScanMealUsecase>()),
  );
}
