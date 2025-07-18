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
  const AppButton({
    super.key,
    required this.buttonType,
    required this.onPressed,
    required this.label,
    this.icon,
    this.padding,
    this.fontSize,
    this.color,
    this.fontColor,
    this.radius,
    this.thickness,
    this.outlineColor,
    this.iconPosition = IconPosition.left,
    this.expand = false,
  });

  const AppButton.primary({
    super.key,
    required this.onPressed,
    this.icon,
    this.label,
    this.padding,
    this.fontSize,
    this.color,
    this.fontColor,
    this.radius,
    this.iconPosition = IconPosition.left,
    this.expand = false,
  })  : buttonType = ButtonType.primary,
        thickness = null,
        outlineColor = null;

  const AppButton.secondary({
    super.key,
    required this.onPressed,
    this.icon,
    this.label,
    this.padding,
    this.fontSize,
    this.color,
    this.fontColor,
    this.radius,
    this.thickness,
    this.outlineColor,
    this.iconPosition = IconPosition.left,
    this.expand = false,
  }) : buttonType = ButtonType.secondary;

  final IconData? icon;
  final String? label;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final void Function()? onPressed;
  final ButtonType buttonType;
  final IconPosition iconPosition;
  final Color? color;
  final Color? fontColor;
  final BorderRadius? radius;
  final double? thickness;
  final Color? outlineColor;
  final bool expand;

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
          return color == null
              ? ThemeColors.onPrimary(context)
              : fontColor ?? ThemeColors.white;
        case ButtonType.secondary:
          return color ?? ThemeColors.primary(context);
      }
    }();

    final buttonRadius = radius ?? ThemeRadius.m.asBorderRadius;

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
            Flexible(
              fit: expand ? FlexFit.tight : FlexFit.loose,
              child: Padding(
                padding: padding ??
                    const EdgeInsets.symmetric(
                      horizontal: ThemeSizes.l,
                      vertical: ThemeSizes.m,
                    ),
                child: AppText(
                  label,
                  textAlign: TextAlign.center,
                  fontSize: fontSize ?? ThemeSizes.l,
                  fontWeight: FontWeight.w600,
                  color: foregroundColor,
                ),
              ),
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
