import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snowflake_flutter_theme/src/widgets/mutation/mutation_state.dart';

part 'mutation_controller.g.dart';

@riverpod
class MutationController extends _$MutationController {
  @override
  MutationState build(int key) {
    return MutationState.idle;
  }

  Future<void> action<T>({
    required Future<T> Function() mutation,
    void Function(T result)? onSuccess,
    VoidCallback? onError,
  }) async {
    state = MutationState.loading;
    await mutate<T>(
      mutation,
      onSuccess: onSuccess,
      onError: onError,
    );
    state = MutationState.idle;
  }
}
