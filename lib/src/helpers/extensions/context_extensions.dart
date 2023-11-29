import 'package:flutter/material.dart';
import 'package:snowflake_flutter_theme/src/helpers/notif.dart';

/// This class defines extensions on build contexts
extension ContextExtensions on BuildContext {
  /// Show a toast message
  void showToast(
    String message, {
    ToastType? type,
    Duration? duration,
  }) {
    Notif.showToast(this, message, type: type, duration: duration);
  }
}
