import 'package:flutter/material.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';
import 'package:toastification/toastification.dart';

/// The type of toast to show
enum ToastType {
  /// Basic messages
  basic,

  /// Success messages
  success,

  /// Warning messages
  warning,

  /// Error messages
  error,
}

/// A class that contains all the methods to show notifications
class Notif {
  /// Show a toast message
  static Future<void> showToast(
    String title,
    String message, {
    required BuildContext context,
    ToastificationType? type,
    ToastificationStyle? style,
    Duration? duration,
  }) async {
    toastification.show(
      context: context,
      type: type,
      style: style ?? ToastificationStyle.fillColored,
      title: AppText.m(title),
      description: AppText.s(message),
      alignment: Alignment.center,
      autoCloseDuration: duration ?? const Duration(seconds: 4),
      borderRadius: ThemeRadius.m.asBorderRadius,
      boxShadow: highModeShadow,
      closeButtonShowType: CloseButtonShowType.none,
      dragToClose: true,
      applyBlurEffect: true,
    );
  }

  static Future<bool> showPopup({
    required BuildContext context,
    required String title,
    required String content,
    required String confirmButton,
    required String cancelButton,
  }) async {
    final userAnswer = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: ThemeSizes.l,
            ),
          ),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(cancelButton),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(confirmButton),
            ),
          ],
        );
      },
    );
    return userAnswer ?? false;
  }
}
