// ignore_for_file: public_member_api_docs
// TODO(jeanvallon): remove this line

import 'package:flutter/material.dart';

/// All theme colors are defined in this class
class ThemeColors {
  static Color primary(BuildContext ctx) => Theme.of(ctx).colorScheme.primary;
  static Color onPrimary(BuildContext ctx) =>
      Theme.of(ctx).colorScheme.onPrimary;
  static Color secondary(BuildContext ctx) =>
      Theme.of(ctx).colorScheme.secondary;
  static Color onSecondary(BuildContext ctx) =>
      Theme.of(ctx).colorScheme.onSecondary;
  static Color background(BuildContext ctx) =>
      Theme.of(ctx).colorScheme.background;
  static Color onBackground(BuildContext ctx) =>
      Theme.of(ctx).colorScheme.onBackground;

  // Painting colors
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGrey = Color(0xFFececec);
  static const Color darkGrey = Color(0xFF9D9D9D);

  // App text colors
  static Color defaultText(BuildContext ctx) => onBackground(ctx);

  // App status colors
  static const Color statusError = Color(0xFFFDE6EE);
  static const Color onStatusError = Color(0xFFF50A42);
  static const Color statusWarning = Color(0xFFFFFAE5);
  static const Color onStatusWarning = Color(0xFFDD960D);
  static const Color statusInfo = lightGrey;
  static Color onStatusInfo(BuildContext ctx) => defaultText(ctx);
  static const Color statusSuccess = Color(0xFFEBFBF1);
  static const Color onStatusSuccess = Color(0xFF00966D);

  // Other app colors
  static const Color debug = Color(0xFF34c85a);
}
