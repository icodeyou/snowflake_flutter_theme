// ignore_for_file: always_use_package_imports

import 'package:flutter/material.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';

/// Function to use in `MaterialApp()` to get main theme
ThemeData getSnowflakeThemeData() {
  final fallbackTheme = ThemeData.fallback();

  return fallbackTheme.copyWith(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: ThemeColors.background,
      elevation: 1,
    ),
    cardTheme: fallbackTheme.cardTheme.copyWith(
      color: ThemeColors.background,
      shadowColor: ThemeColors.darkGrey,
      surfaceTintColor: ThemeColors.onBackground,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: ThemeRadius.m.asBorderRadius,
        side: const BorderSide(color: ThemeColors.onBackground),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: ThemeColors.appPrimary,
      secondary: ThemeColors.appAccent,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: fallbackTheme.textTheme.bodyMedium,
        backgroundColor: ThemeColors.appAccent,
        shape: RoundedRectangleBorder(
          borderRadius: ThemeRadius.m.asBorderRadius,
        ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: ThemeColors.appPrimary,
      size: ThemeSizes.l,
    ),
    scaffoldBackgroundColor: ThemeColors.background,
  );
}
