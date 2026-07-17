import 'package:flutter/material.dart';
import 'package:food_calorie_scanner/core/utils/router/app_router.dart';
import 'package:food_calorie_scanner/core/utils/service_locator/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      routerConfig: AppRouter.router,
    );
  }
}
