// ignore_for_file: public_member_api_docs
// TODO(jeanvallon): remove this line

import 'package:flutter/material.dart';

/// All theme colors are defined in this class
class ThemeColors {
  // Painting colors
  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const lightGrey = Color(0xFFececec);
  static const darkGrey = Color(0xFF9D9D9D);

  // App basic colors
  static const appPrimary = Color(0xFF11a5ed);
  static const onAppPrimary = ThemeColors.white;
  static const accent = Color(0xFF4402A1);
  static const onAccent = ThemeColors.white;
  static const background = Color(0xFFEDF3F5);
  static const onBackground = Color(0xFF2F2F2F);

  // App text colors
  static const defaultText = onBackground;

  // App status colors
  static const statusError = Color(0xFFFDE6EE);
  static const onStatusError = Color(0xFFF50A42);
  static const statusWarning = Color(0xFFFFFAE5);
  static const onStatusWarning = Color(0xFFDD960D);
  static const statusInfo = lightGrey;
  static const onStatusInfo = defaultText;
  static const statusSuccess = Color(0xFFEBFBF1);
  static const onStatusSuccess = Color(0xFF00966D);

  // Other app colors
  static const debug = Color(0xFF34c85a);
}
