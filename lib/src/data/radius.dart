
import 'package:flutter/material.dart';

/// All radius are defined in this class
class ThemeRadius {
  
  /// XS corners
  static const xs = Radius.circular(4);
  
  /// S corners
  static const s = Radius.circular(8);
  
  /// M corners
  static const m = Radius.circular(16);
}

/// Extensions on Radius
extension ThemeRadiusExtensions on Radius {

  /// Transform Radius into BorderRadius, applied on all sides
  BorderRadius get asBorderRadius => BorderRadius.all(this);
}
