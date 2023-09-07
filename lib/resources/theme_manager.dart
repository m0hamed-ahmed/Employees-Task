import 'package:employees/resources/colors_manager.dart';
import 'package:flutter/material.dart';

MaterialColor buildMaterialColor(Color color) {
  List<double> strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red;
  final int g = color.green;
  final int b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  for (int i = 0; i < strengths.length; i++) {
    double strength = strengths[i];
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

ThemeData getApplicationTheme({required bool isLight}) {
  if(isLight) {
    return _getApplicationThemeLight();
  }
  else {
    return _getApplicationThemeDark();
  }
}

ThemeData _getApplicationThemeLight() {
  return ThemeData(
    // Main Colors
    primarySwatch: buildMaterialColor(ColorsManager.color1),
    scaffoldBackgroundColor: ColorsManager.white,
    
    // Text Theme
    textTheme: TextTheme(
      titleSmall: TextStyle(color: ColorsManager.color1, fontSize: 12),
      titleMedium: TextStyle(color: ColorsManager.color1, fontSize: 14),
      titleLarge: TextStyle(color: ColorsManager.color1, fontSize: 16),

      bodySmall: const TextStyle(color: ColorsManager.black, fontSize: 12),
      bodyMedium: const TextStyle(color: ColorsManager.black, fontSize: 14),
      bodyLarge: const TextStyle(color: ColorsManager.black, fontSize: 16),

      displaySmall: const TextStyle(color: ColorsManager.grey, fontSize: 12),
      displayMedium: const TextStyle(color: ColorsManager.grey, fontSize: 14),
      displayLarge: const TextStyle(color: ColorsManager.grey, fontSize: 16),
    ),
  );
}

ThemeData _getApplicationThemeDark() {
  return ThemeData(
    // Main Colors
    primarySwatch: buildMaterialColor(ColorsManager.color1),
    scaffoldBackgroundColor: ColorsManager.color2,

    // Text Theme
    textTheme: TextTheme(
      titleSmall: TextStyle(color: ColorsManager.color1, fontSize: 12),
      titleMedium: TextStyle(color: ColorsManager.color1, fontSize: 14),
      titleLarge: TextStyle(color: ColorsManager.color1, fontSize: 16),

      bodySmall: const TextStyle(color: ColorsManager.white, fontSize: 12),
      bodyMedium: const TextStyle(color: ColorsManager.white, fontSize: 14),
      bodyLarge: const TextStyle(color: ColorsManager.white, fontSize: 16),

      displaySmall: const TextStyle(color: ColorsManager.grey, fontSize: 12),
      displayMedium: const TextStyle(color: ColorsManager.grey, fontSize: 14),
      displayLarge: const TextStyle(color: ColorsManager.grey, fontSize: 16),
    ),
  );
}