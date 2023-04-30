import 'package:flutter/material.dart';
import 'app_colors.dart';

final ThemeData appThemeData = ThemeData(
  fontFamily: 'OpenSans',
  scaffoldBackgroundColor: AppColors.black,
  primaryColor: AppColors.black,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.black,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(
      fontSize: 14,
      color: AppColors.black,
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.black,
      ),
    ),
  ),
);
