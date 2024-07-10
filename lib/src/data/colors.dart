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
  static const grey10 = Color.fromARGB(255, 230, 230, 230);
  static const grey20 = Color.fromARGB(255, 204, 204, 204);
  static const grey30 = Color.fromARGB(255, 178, 178, 178);
  static const grey40 = Color.fromARGB(255, 153, 153, 153);
  static const grey60 = Color.fromARGB(255, 102, 102, 102);
  static const grey80 = Color.fromARGB(255, 51, 51, 51);

  // App text colors
  static Color defaultText(BuildContext ctx) => onBackground(ctx);

  // App status colors
  static const Color statusError = Color(0xFFF50A42);
  static const Color lightStatusError = Color(0xFFFDE6EE);
  static const Color statusWarning = Color(0xFFDD960D);
  static const Color lightStatusWarning = Color(0xFFFFFAE5);
  static const Color statusInfo = grey60;
  static Color lightStatusInfo = grey10;
  static const Color statusSuccess = Color(0xFF00966D);
  static const Color lightStatusSuccess = Color(0xFFEBFBF1);

  // Other app colors
  static const Color debug = Color(0xFF34c85a);
}
