import 'package:flutter/material.dart';

/// All sizes are defined in this class
// ignore_for_file: public_member_api_docs
// TODO(jeanvallon): remove this line

class ThemeSizes {
  static const double xxxs = 2;
  static const double xxs = 4;
  static const double xs = 8;
  static const double s = 12;
  static const double m = 16;
  static const double l = 20;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 40;
}

extension ThemeSizesExtensions on double {
  EdgeInsets get asInsets => EdgeInsets.all(this);
}
