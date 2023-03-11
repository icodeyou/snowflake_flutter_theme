import 'package:flutter/material.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';
import 'package:snowflake_flutter_theme/src/style/data/colors.dart';
import 'package:snowflake_flutter_theme/src/style/data/radius.dart';
import 'package:snowflake_flutter_theme/src/style/data/sizes.dart';

/// SnackbarType to choose when using the method showSnackBar()
enum SnackBarType {
  /// For snackbars displaying an error message
  error,

  /// For snackbars displaying an error message
  success,

  /// For snackbars displaying an error message
  warning,

  /// For snackbars displaying an info message
  info,
}

/// The color of the background of the snackbar.
Color _getBackgroundColor(BuildContext context, SnackBarType type) {
  switch (type) {
    case SnackBarType.error:
      return ThemeColors.statusError;
    case SnackBarType.success:
      return ThemeColors.statusSuccess;
    case SnackBarType.warning:
      return ThemeColors.statusWarning;
    case SnackBarType.info:
      return ThemeColors.statusInfo;
  }
}

/// Show a Snackbar
ScaffoldFeatureController showSnackBar(
  BuildContext context, {
  required String message,
  required SnackBarType type,
  String? title,
  double? bottomOffset,
  VoidCallback? onTap,
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(ThemeSizes.s),
      margin: EdgeInsets.only(
        bottom: bottomOffset ??
            MediaQuery.of(context).padding.bottom + ThemeSizes.l,
        top: ThemeSizes.xs,
        left: ThemeSizes.xs,
        right: ThemeSizes.xs,
      ),
      backgroundColor: _getBackgroundColor(context, type),
      shape: RoundedRectangleBorder(
        borderRadius: ThemeRadius.s.asBorderRadius,
      ),
      content: SnackBarBody(
        title: title,
        message: message,
        type: type,
        onTap: onTap ?? ScaffoldMessenger.of(context).hideCurrentSnackBar,
      ),
    ),
  );
}

/// Put a wrapper around the SnackBarBody to use
/// the snackbar notification without calling showSnackBar from
/// the [ScaffoldMessenger]
class SnackBarNotification extends StatelessWidget {
  /// Default constructor
  const SnackBarNotification({
    required this.message,
    required this.type,
    super.key,
    this.title,
    this.isLoading = false,
    this.onTap,
  });

  /// The title of the snackbar. If null, no title is shown
  final String? title;

  /// The content, placed bellow the title
  final String message;

  /// The type of the snackbar
  final SnackBarType type;

  /// Display a loader in the snackbar
  final bool isLoading;

  /// A function called when the snackbar is tapped
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(ThemeSizes.s),
      decoration: BoxDecoration(
        color: _getBackgroundColor(context, type),
        borderRadius: ThemeRadius.s.asBorderRadius,
      ),
      child: SnackBarBody(
        title: title,
        message: message,
        type: type,
        isLoading: isLoading,
        onTap: onTap,
      ),
    );
  }
}

/// Body of the SnackBar returned by [showSnackBar]
class SnackBarBody extends StatelessWidget {
  /// Default constructor
  const SnackBarBody({
    required this.message,
    required this.type,
    super.key,
    this.title,
    this.isLoading = false,
    this.onTap,
  });

  /// The title of the snackbar. If null, no title is shown
  final String? title;

  /// The content, placed bellow the title
  final String message;

  /// The type of the snackbar
  final SnackBarType type;

  /// Display a loader in the snackbar
  final bool isLoading;

  /// A function called when the snackbar is tapped
  final VoidCallback? onTap;

  /// The color of the elements of the snackbar.
  Color getOnBackgroundColor(BuildContext context) {
    switch (type) {
      case SnackBarType.error:
        return ThemeColors.onStatusError;
      case SnackBarType.success:
        return ThemeColors.onStatusSuccess;
      case SnackBarType.warning:
        return ThemeColors.onStatusWarning;
      case SnackBarType.info:
        return ThemeColors.onStatusInfo;
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = this.title;

    final content = Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            AppText.bodyLarge(
              title,
              color: getOnBackgroundColor(context),
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: ThemeSizes.xs,
            ),
          ],
          AppText.bodyMedium(
            message,
            color: getOnBackgroundColor(context),
          ),
        ],
      ),
    );

    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      child: content,
    );
  }
}
