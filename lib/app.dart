import 'package:flutter/material.dart';

import 'core/app_colors.dart';
import 'screens/onboarding/onboarding_1_screen.dart';

/// The root widget of the app. The first screen is Onboarding 1.
class CarHubApp extends StatelessWidget {
  const CarHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CarHub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(primary: AppColors.cyan),
      ),
      home: const Onboarding1Screen(),
    );
  }
}
