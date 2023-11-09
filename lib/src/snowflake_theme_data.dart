// ignore_for_file: always_use_package_imports

import 'package:flutter/material.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';

/// Function to use in `MaterialApp()` to get main theme
/// [mode] defines whether the theme is light or dark
/// [appColors] defines colors that are specific to the app
ThemeData getSnowflakeThemeData({
  required ThemeMode mode,
  ({
    Color primary,
    Color onPrimary,
    Color secondary,
    Color onSecondary,
    Color background,
    Color onBackground,
  })? appColors,
}) {
  final fallbackTheme = ThemeData.fallback();

  return fallbackTheme.copyWith(
    brightness: mode == ThemeMode.dark ? Brightness.dark : Brightness.light,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: appColors?.primary,
      onPrimary: appColors?.onPrimary,
      secondary: appColors?.secondary,
      onSecondary: appColors?.onSecondary,
      background: Colors.amber,
      onBackground: appColors?.onBackground,
    ),
    scaffoldBackgroundColor: ThemeColors.background,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: ThemeColors.background,
      elevation: 1,
    ),
    textTheme: fallbackTheme.textTheme.apply(
      bodyColor: ThemeColors.defaultText,
      displayColor: ThemeColors.defaultText,
    ),
    cardTheme: fallbackTheme.cardTheme.copyWith(
      color: ThemeColors.white,
      shadowColor: ThemeColors.darkGrey,
      surfaceTintColor: ThemeColors.onBackground,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: ThemeRadius.m.asBorderRadius,
        side: BorderSide(color: ThemeColors.onBackground),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // TODO(jeanvallon): Find a way to get style from AppText.m()
        textStyle: fallbackTheme.textTheme.bodyMedium,
        backgroundColor: ThemeColors.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: ThemeRadius.m.asBorderRadius,
        ),
      ),
    ),
    iconTheme: IconThemeData(
      color: ThemeColors.primary,
      size: ThemeSizes.l,
    ),
  );
}
