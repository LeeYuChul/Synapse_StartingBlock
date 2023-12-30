import 'package:flutter/material.dart';
import 'package:starting_block/constants/color_table.dart';
import 'package:starting_block/constants/sizes.dart';

class ThemeManage {
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.blue,
          fontSize: Sizes.size8,
          fontWeight: FontWeight.w600,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.g2),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.g2),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.activered),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.activered),
        ),
      ),
    );
  }
}
