import 'package:flutter/material.dart';
import 'package:logger/web.dart';

enum MutationState { idle, loading }

Future<void> mutate<T>(
  Future<T> Function() mutation, {
  void Function(T result)? onSuccess,
  VoidCallback? onError,
}) async {
  try {
    final result = await mutation();
    onSuccess?.call(result);
  } catch (e) {
     Logger().e('Mutation failed : $e');
    onError?.call();
  }
}
