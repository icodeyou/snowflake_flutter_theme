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
    appBarTheme: AppBarTheme(
      backgroundColor: appColors.background,
      foregroundColor: appColors.onBackground,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: appColors.onPrimary,
      unselectedItemColor: appColors.onPrimary.withAlpha(51),
      backgroundColor: appColors.background,
    ),
    navigationBarTheme: NavigationBarThemeData(
      height: 65,
      backgroundColor: appColors.background,
      labelTextStyle: WidgetStateProperty.all(
        TextStyle(
          color: appColors.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
      indicatorColor: appColors.primary,
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(
            color: appColors.onPrimary,
          );
        }
        return IconThemeData(
          color: appColors.primary.withAlpha(51),
        );
      }),
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
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(appColors.primary),
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
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: appColors.primary,
      onPrimary: appColors.onPrimary,
      secondary: appColors.secondary,
      onSecondary: appColors.onSecondary,
      surface: appColors.background,
      onSurface: appColors.onBackground,
      outline: Colors.transparent,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: appColors.background,
      titleTextStyle: TextStyle(color: appColors.primary),
      contentTextStyle: TextStyle(color: appColors.onBackground),
    ),
    dividerTheme: const DividerThemeData(
      color: ThemeColors.grey30,
      space: ThemeSizes.s,
      thickness: 1,
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
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: appColors.secondary,
      foregroundColor: appColors.onSecondary,
    ),
    iconTheme: IconThemeData(
      color: appColors.primary,
      size: ThemeSizes.l,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: appColors.background,
      focusColor: appColors.primary,
      labelStyle: TextStyle(color: appColors.onBackground),
      hintStyle: TextStyle(color: appColors.onBackground.withAlpha(100)),
      helperStyle: TextStyle(
        color: appColors.onBackground,
        fontWeight: FontWeight.w300,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: appColors.onBackground),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: appColors.onBackground),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: appColors.primary,
        side: BorderSide(color: appColors.primary),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(appColors.primary),
    ),
    scaffoldBackgroundColor: appColors.background,
    snackBarTheme: SnackBarThemeData(
      backgroundColor: appColors.secondary,
      contentTextStyle: TextStyle(color: appColors.onSecondary),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(appColors.primary),
      trackColor: WidgetStateProperty.all(appColors.secondary),
      trackOutlineColor: WidgetStateProperty.all(appColors.secondary),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: appColors.primary,
      unselectedLabelColor: appColors.onBackground,
    ),
    textTheme: fallbackTheme.textTheme.apply(
      bodyColor: appColors.onBackground,
      displayColor: appColors.onBackground,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: appColors.primary,
      ),
    ),
  );
}
