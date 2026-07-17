import 'package:food_calorie_scanner/feature/scan_food/presentation/scan_meal_result_view.dart';
import 'package:food_calorie_scanner/feature/scan_food/presentation/scan_meal_view.dart';
import 'package:food_calorie_scanner/core/utils/router/routes_name.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: RoutesName.scanMeal,
        name: RoutesName.scanMeal,
        builder: (context, state) => ScanMealView(),
      ),
      GoRoute(
        path: RoutesName.scanMealResult,
        name: RoutesName.scanMealResult,
        builder: (context, state) => ScanMealResultView(),
      ),
    ],
  );
}
