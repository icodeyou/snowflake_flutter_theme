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
  static Color black = const Color(0xFF000000);
  static Color white = const Color(0xFFFFFFFF);
  static Color lightGrey = const Color(0xFFececec);
  static Color darkGrey = const Color(0xFF9D9D9D);

  // App text colors
  static Color defaultText(BuildContext ctx) => onBackground(ctx);

  // App status colors
  static Color statusError = const Color(0xFFFDE6EE);
  static Color onStatusError = const Color(0xFFF50A42);
  static Color statusWarning = const Color(0xFFFFFAE5);
  static Color onStatusWarning = const Color(0xFFDD960D);
  static Color statusInfo = lightGrey;
  static Color onStatusInfo(BuildContext ctx) => defaultText(ctx);
  static Color statusSuccess = const Color(0xFFEBFBF1);
  static Color onStatusSuccess = const Color(0xFF00966D);

  // Other app colors
  static Color debug = const Color(0xFF34c85a);
}
