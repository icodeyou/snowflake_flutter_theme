import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';
import 'package:snowflake_flutter_theme/src/widgets/mutation/mutation_controller.dart';
import 'package:snowflake_flutter_theme/src/widgets/mutation/mutation_state.dart';

class MutationButton<T> extends ConsumerWidget {
  const MutationButton({
    super.key,
    this.iconPosition = IconPosition.left,
    required this.buttonType,
    this.expand = false,
    this.icon,
    this.label,
    this.padding,
    this.fontSize,
    this.color,
    this.fontColor,
    this.radius,
    this.thickness,
    this.outlineColor,
    required this.onPressed,
    this.onSuccess,
    this.onError,
  });

  final IconPosition iconPosition;
  final ButtonType buttonType;
  final bool expand;
  final IconData? icon;
  final String? label;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final Color? color;
  final Color? fontColor;
  final BorderRadius? radius;
  final double? thickness;
  final Color? outlineColor;

  final Future<T> Function() onPressed;
  final void Function(T)? onSuccess;
  final VoidCallback? onError;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mutationState = ref.watch(mutationControllerProvider(hashCode));
    switch (mutationState) {
      case MutationState.loading:
        return CircularProgressIndicator(color: color);
      case MutationState.idle:
        return AppButton(
          iconPosition: iconPosition,
          buttonType: buttonType,
          expand: expand,
          icon: icon,
          label: label,
          padding: padding,
          fontSize: fontSize,
          color: color,
          fontColor: fontColor,
          radius: radius,
          thickness: thickness,
          outlineColor: outlineColor,
          onPressed: () async {
            await ref
                .read(mutationControllerProvider(hashCode).notifier)
                .action<T>(
                  mutation: onPressed,
                  onSuccess: onSuccess,
                  onError: onError,
                );
          },
        );
    }
  }
}
