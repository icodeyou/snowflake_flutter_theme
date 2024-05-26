import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';

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
  static void showToast(
    String message, {
    required BuildContext context,
    ToastType? type,
    Duration? duration,
  }) {
    BotToast.showText(
      text: message,
      textStyle: TextStyle(
        color: _getStatusColor(type, !context.isDarkMode),
        fontSize: ThemeSizes.xl,
        fontWeight: FontWeight.bold,
      ),
      align: Alignment.bottomCenter,
      crossPage: true,
      contentColor: _getStatusColor(type, context.isDarkMode),
    );
  }

  static Color _getStatusColor(ToastType? type, bool isLight) {
    return type == ToastType.error
        ? (isLight ? ThemeColors.lightStatusError : ThemeColors.statusError)
        : type == ToastType.success
            ? (isLight
                ? ThemeColors.lightStatusSuccess
                : ThemeColors.statusSuccess)
            : type == ToastType.warning
                ? (isLight
                    ? ThemeColors.lightStatusWarning
                    : ThemeColors.statusWarning)
                : (isLight
                    ? ThemeColors.lightStatusInfo
                    : ThemeColors.statusInfo);
  }

  static void showPopup({
    required BuildContext context,
    required String title,
    required String content,
    required String confirmButton,
    required String cancelButton,
    required VoidCallback onConfirm,
    VoidCallback? onCancelBeforePop,
  }) {
    showDialog(
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
                onCancelBeforePop?.call();
                Navigator.of(context).pop();
              },
              child: Text(cancelButton),
            ),
            TextButton(
              onPressed: () {
                onConfirm();
                Navigator.of(context).pop();
              },
              child: Text(confirmButton),
            ),
          ],
        );
      },
    );
  }
}
