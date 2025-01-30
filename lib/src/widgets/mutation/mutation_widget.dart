import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snowflake_flutter_theme/src/widgets/mutation/mutation_controller.dart';

class MutationWidget<T> extends ConsumerWidget {
  const MutationWidget({
    super.key,
    required this.child,
    required this.onPressed,
    this.onSuccess,
    this.onError,
  });

  final Widget child;
  final Future<T> Function() onPressed;
  final void Function(T)? onSuccess;
  final VoidCallback? onError;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        await ref.read(mutationControllerProvider(hashCode).notifier).action<T>(
              mutation: onPressed,
              onSuccess: onSuccess,
              onError: onError,
            );
      },
      child: child,
    );
  }
}
