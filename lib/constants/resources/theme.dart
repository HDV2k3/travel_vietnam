import 'package:flutter/material.dart';

import 'colors.dart';

class AppThemes {
  static ThemeData appTheme(bool isDarkTheme) {
    final appColors = isDarkTheme ? AppColors.dark : AppColors.light;
    return ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: appColors.tint,
        foregroundColor: appColors.white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: appColors.tint,
        selectedItemColor: appColors.white,
        unselectedItemColor: appColors.disable,
      ),
    );
  }
}
