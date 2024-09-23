import 'package:flutter/material.dart';

/// All sizes (height and width, paddings, margins) are defined in this class

class ThemeSizes {

  /// Symmetric padding
  static EdgeInsets sym({
    double h = 0,
    double v = 0,
  }) =>
      EdgeInsets.symmetric(
        horizontal: h,
        vertical: v,
      );

  /// XXXS size
  static const double xxxs = 2;

  /// XXS size
  static const double xxs = 4;

  /// XS size
  static const double xs = 8;

  /// S size
  static const double s = 12;

  /// M size
  static const double m = 16;

  /// L size
  static const double l = 20;

  /// XL size
  static const double xl = 24;

  /// XXL size
  static const double xxl = 32;

  /// XXXL size
  static const double xxxl = 40;
}

/// Size extensions on double
extension ThemeSizesExtensions on double {
  /// Transform double into EdgeInsets, applied on all sides
  EdgeInsets get asInsets => EdgeInsets.all(this);
}

/// Size extensions on EdgeInsets
extension EwaSizesInsetsExtensions on EdgeInsets {
  /// Remove vertical borders
  EdgeInsets get horizontalOnly => copyWith(top: 0, bottom: 0);

  /// Remove horizontal borders
  EdgeInsets get verticalOnly => copyWith(right: 0, left: 0);
}
