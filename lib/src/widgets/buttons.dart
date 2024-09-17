// ignore_for_file: public_member_api_docs
// TODO(jeanvallon): remove this line

import 'package:flutter/material.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';

enum ButtonType {
  primary,
  secondary,
}

enum IconPosition { left, right }

/// Button with the AppTheme
class AppButton extends StatelessWidget {
  const AppButton.primary({
    required this.onPressed,
    super.key,
    this.icon,
    this.label,
    this.color,
    this.iconPosition = IconPosition.left,
  })  : buttonType = ButtonType.primary,
        thickness = null,
        outlineColor = null;

  const AppButton.secondary({
    required this.onPressed,
    super.key,
    this.icon,
    this.label,
    this.color,
    this.thickness,
    this.outlineColor,
    this.iconPosition = IconPosition.left,
  }) : buttonType = ButtonType.secondary;

  final IconData? icon;
  final String? label;
  final void Function()? onPressed;
  final ButtonType buttonType;
  final IconPosition iconPosition;
  final Color? color;

  final double? thickness;
  final Color? outlineColor;

  @override
  Widget build(BuildContext context) {
    final label = this.label;
    final isDisabled = onPressed == null;
    final onButtonPress = isDisabled ? null : onPressed;

    // Currently we use TextDirection and Directionality to place the icon
    // There is no proper prop to use to do it
    // There is an open issue on the Flutter repo to do it : https://github.com/flutter/flutter/issues/71941
    final direction = () {
      if (label == null || icon == null) {
        return TextDirection.ltr;
      }
      if (iconPosition == IconPosition.left) {
        return TextDirection.ltr;
      }
      return TextDirection.rtl;
    }();

    final foregroundColor = () {
      switch (buttonType) {
        case ButtonType.primary:
          return ThemeColors.white;
        case ButtonType.secondary:
          return color ?? ThemeColors.primary(context);
      }
    }();

    final buttonRadius = ThemeRadius.xs.asBorderRadius;

    final style = () {
      switch (buttonType) {
        case ButtonType.primary:
          return ElevatedButton.styleFrom(
            backgroundColor: color ?? ThemeColors.primary(context),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: buttonRadius,
            ),
          );
        case ButtonType.secondary:
          return OutlinedButton.styleFrom(
            elevation: 0,
            side: BorderSide(
              width: thickness ?? 1,
              color: outlineColor ?? foregroundColor,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: buttonRadius,
            ),
          );
      }
    }();

    final buttonIcon = () {
      return (icon != null)
          ? Icon(
              icon,
              color: foregroundColor,
            )
          : null;
    }();

    final buttonChild = () {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (buttonIcon != null) buttonIcon,
          if (buttonIcon != null && label != null)
            const SizedBox(
              width: ThemeSizes.s,
            ),
          if (label != null)
            AppText.l(
              label,
              fontWeight: FontWeight.w600,
              color: foregroundColor,
            ),
        ],
      );
    }();

    return Directionality(
      textDirection: direction,
      child: () {
        switch (buttonType) {
          case ButtonType.primary:
            return ElevatedButton(
              style: style,
              onPressed: onButtonPress,
              child: buttonChild,
            );

          case ButtonType.secondary:
            return OutlinedButton(
              style: style,
              onPressed: onButtonPress,
              child: buttonChild,
            );
        }
      }(),
    );
  }
}
