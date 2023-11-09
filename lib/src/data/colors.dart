// ignore_for_file: public_member_api_docs
// TODO(jeanvallon): remove this line

import 'package:flutter/material.dart';

/// All theme colors are defined in this class
class ThemeColors {
  static Color get primary => ThemeData.fallback().colorScheme.primary;
  static Color get onPrimary => ThemeData.fallback().colorScheme.onPrimary;
  static Color get secondary => ThemeData.fallback().colorScheme.secondary;
  static Color get onSecondary => ThemeData.fallback().colorScheme.onSecondary;
  static Color get background => ThemeData.fallback().colorScheme.background;
  static Color get onBackground =>
      ThemeData.fallback().colorScheme.onBackground;

  // Painting colors
  static Color black = const Color(0xFF000000);
  static Color white = const Color(0xFFFFFFFF);
  static Color lightGrey = const Color(0xFFececec);
  static Color darkGrey = const Color(0xFF9D9D9D);

  // App text colors
  static Color defaultText = onBackground;

  // App status colors
  static Color statusError = const Color(0xFFFDE6EE);
  static Color onStatusError = const Color(0xFFF50A42);
  static Color statusWarning = const Color(0xFFFFFAE5);
  static Color onStatusWarning = const Color(0xFFDD960D);
  static Color statusInfo = lightGrey;
  static Color onStatusInfo = defaultText;
  static Color statusSuccess = const Color(0xFFEBFBF1);
  static Color onStatusSuccess = const Color(0xFF00966D);

  // Other app colors
  static Color debug = const Color(0xFF34c85a);
}
