import 'package:flutter/material.dart';
import 'package:snowflake_flutter_theme/src/helpers/notif.dart';

/// This class defines extensions on build contexts
extension ContextExtensions on BuildContext {
  /// Show a toast message
  void showToast({
    required String title,
    required String message,
    ToastType? type,
    Duration? duration,
  }) {
    Notif.showToast(
      title: title,
      message: message,
      context: this,
      type: type,
      duration: duration,
    );
  }

  /// Return true if the app is in dark mode
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
