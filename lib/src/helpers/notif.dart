import 'package:flutter/material.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';
import 'package:toastification/toastification.dart';

/// The type of toast to show
enum ToastType { basic, success, warning, error }

/// The style of the toast
enum ToastStyle { fillColored, flat, flatColored, minimal, simple }

final typeMapper = {
  ToastType.basic: ToastificationType.info,
  ToastType.success: ToastificationType.success,
  ToastType.warning: ToastificationType.warning,
  ToastType.error: ToastificationType.error,
};

final styleMapper = {
  ToastStyle.fillColored: ToastificationStyle.fillColored,
  ToastStyle.flat: ToastificationStyle.flat,
  ToastStyle.flatColored: ToastificationStyle.flatColored,
  ToastStyle.minimal: ToastificationStyle.minimal,
  ToastStyle.simple: ToastificationStyle.simple,
};

/// A class that contains all the methods to show notifications
class Notif {
  /// Show a toast message
  static Future<void> showToast({
    required String title,
    required String message,
    required BuildContext context,
    ToastType? type,
    ToastStyle? style,
    Duration? duration,
    bool abortPrevious = true,
    bool transparent = true,
    bool progressBar = true,
    bool dragToClose = true,
    bool closeOnClick = true,
  }) async {
    if (abortPrevious) {
      toastification.dismissAll();
    }
    toastification.show(
      context: context,
      type: typeMapper[type ?? ToastType.basic],
      style: styleMapper[style ?? ToastStyle.fillColored],
      title: AppText.m(title, maxLines: 2),
      description: AppText.s(message, maxLines: 12),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: duration ?? const Duration(seconds: 4),
      borderRadius: ThemeRadius.m.asBorderRadius,
      boxShadow: highModeShadow,
      closeButtonShowType: CloseButtonShowType.none,
      dragToClose: dragToClose,
      closeOnClick: closeOnClick,
      applyBlurEffect: transparent,
      showProgressBar: progressBar,
    );
  }

  static Future<bool> showPopup({
    required BuildContext context,
    required String title,
    required String content,
    required String confirmButton,
    String? cancelButton,
    bool closePopup = true,
  }) async {
    final userAnswer = await showDialog<bool>(
      context: context,
      barrierDismissible: closePopup,
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
            if (cancelButton != null) ...[
              TextButton(
                onPressed: () {
                  if (closePopup) {
                    Navigator.of(context).pop(false);
                  }
                },
                child: Text(cancelButton),
              ),
            ],
            TextButton(
              onPressed: () {
                if (closePopup) {
                  Navigator.of(context).pop(true);
                }
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
