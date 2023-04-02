// ignore_for_file: public_member_api_docs
// TODO(jeanvallon): remove this line

import 'package:flutter/material.dart';

/// All radius are defined in this class
class ThemeRadius {
  static const xs = Radius.circular(4);
  static const s = Radius.circular(8);
  static const m = Radius.circular(16);
}

extension ThemeRadiusExtensions on Radius {
  BorderRadius get asBorderRadius => BorderRadius.all(this);
}
