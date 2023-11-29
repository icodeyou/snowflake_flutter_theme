// ignore_for_file: always_use_package_imports

import 'package:flutter/material.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';
import 'package:snowflake_flutter_theme/src/data/font_sizes.dart';

/// Function to use in `MaterialApp()` to get main theme
/// [mode] defines whether the theme is light or dark
/// [appColors] defines colors that are specific to the app
ThemeData getSnowflakeThemeData({
  required ThemeMode mode,
  required ({
    Color primary,
    Color onPrimary,
    Color secondary,
    Color onSecondary,
    Color background,
    Color onBackground,
  }) appColors,
}) {
  final fallbackTheme = ThemeData.fallback(useMaterial3: true);

  return fallbackTheme.copyWith(
    brightness: mode == ThemeMode.dark ? Brightness.dark : Brightness.light,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: appColors.primary,
      onPrimary: appColors.onPrimary,
      secondary: appColors.secondary,
      onSecondary: appColors.onSecondary,
      background: appColors.background,
      onBackground: appColors.onBackground,
      outline: Colors.transparent,
    ),
    scaffoldBackgroundColor: appColors.background,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: appColors.background,
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: appColors.primary,
      foregroundColor: appColors.onPrimary,
    ),
    textTheme: fallbackTheme.textTheme.apply(
      bodyColor: appColors.onBackground,
      displayColor: appColors.onBackground,
    ),
    cardTheme: fallbackTheme.cardTheme.copyWith(
      color: ThemeColors.white,
      shadowColor: ThemeColors.grey60,
      surfaceTintColor: appColors.onBackground,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: ThemeRadius.m.asBorderRadius,
        side: BorderSide(color: appColors.onBackground),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: appColors.onPrimary,
        backgroundColor: appColors.primary,
        textStyle: const TextStyle(
          fontSize: ThemeFontSizes.s,
          fontWeight: FontWeight.w500,
          color: ThemeColors.white,
        ),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: ThemeRadius.m.asBorderRadius,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: appColors.primary,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: appColors.primary,
        side: BorderSide(color: appColors.primary),
      ),
    ),
    iconTheme: IconThemeData(
      color: appColors.primary,
      size: ThemeSizes.l,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(appColors.primary),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(appColors.primary),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(appColors.primary),
      trackColor: MaterialStateProperty.all(appColors.secondary),
      trackOutlineColor: MaterialStateProperty.all(appColors.secondary),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: appColors.background,
      focusColor: appColors.primary,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: appColors.primary,
      unselectedItemColor: appColors.onBackground,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: appColors.background,
      titleTextStyle: TextStyle(color: appColors.primary),
      contentTextStyle: TextStyle(color: appColors.onBackground),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: appColors.secondary,
      contentTextStyle: TextStyle(color: appColors.onSecondary),
    ),
    dividerTheme: const DividerThemeData(
      color: ThemeColors.grey10,
      space: ThemeSizes.s,
      thickness: 1,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: appColors.primary,
      unselectedLabelColor: appColors.onBackground,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: appColors.background,
      labelStyle: TextStyle(color: appColors.onBackground),
      disabledColor: ThemeColors.grey40,
      selectedColor: appColors.primary,
      secondarySelectedColor: appColors.secondary,
      secondaryLabelStyle: TextStyle(color: appColors.onSecondary),
      elevation: 0,
      checkmarkColor: appColors.primary,
      surfaceTintColor: appColors.primary,
      deleteIconColor: appColors.primary,
    ),
  );
}
