import 'package:flutter/material.dart';

/// This class defines extensions on build contexts
extension ContextExtensions on BuildContext {
  /// Return true if the app is in dark mode
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
