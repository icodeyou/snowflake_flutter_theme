import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';
import 'package:snowflake_flutter_theme/src/widgets/mutation/mutation_controller.dart';

class MutationButton<T> extends ConsumerWidget {
  const MutationButton({
    super.key,
    required this.iconPosition,
    required this.buttonType,
    required this.expand,
    required this.icon,
    required this.label,
    required this.fontSize,
    required this.color,
    required this.fontColor,
    required this.radius,
    required this.thickness,
    required this.outlineColor,
    required this.onPressed,
    this.onSuccess,
    this.onError,
  });

  final IconPosition iconPosition;
  final ButtonType buttonType;
  final bool expand;
  final IconData icon;
  final String label;
  final double fontSize;
  final Color color;
  final Color fontColor;
  final double radius;
  final double thickness;
  final Color outlineColor;

  final Future<T> Function() onPressed;
  final void Function(T)? onSuccess;
  final VoidCallback? onError;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      iconPosition: iconPosition,
      buttonType: buttonType,
      expand: expand,
      icon: icon,
      label: label,
      fontSize: fontSize,
      color: color,
      fontColor: fontColor,
      radius: radius,
      thickness: thickness,
      outlineColor: outlineColor,
      onPressed: () async {
        await ref.read(mutationControllerProvider(hashCode).notifier).action<T>(
              mutation: onPressed,
              onSuccess: onSuccess,
              onError: onError,
            );
      },
    );
  }
}
