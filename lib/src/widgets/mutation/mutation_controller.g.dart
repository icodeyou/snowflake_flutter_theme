// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mutation_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MyMutationController)
const myMutationControllerProvider = MyMutationControllerFamily._();

final class MyMutationControllerProvider
    extends $NotifierProvider<MyMutationController, MutationState> {
  const MyMutationControllerProvider._(
      {required MyMutationControllerFamily super.from,
      required int super.argument})
      : super(
          retry: null,
          name: r'myMutationControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$myMutationControllerHash();

  @override
  String toString() {
    return r'myMutationControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MyMutationController create() => MyMutationController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MutationState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MutationState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MyMutationControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$myMutationControllerHash() =>
    r'6b7e979c0c7e0e5e4e81f28ec70d41705d22d471';

final class MyMutationControllerFamily extends $Family
    with
        $ClassFamilyOverride<MyMutationController, MutationState, MutationState,
            MutationState, int> {
  const MyMutationControllerFamily._()
      : super(
          retry: null,
          name: r'myMutationControllerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  MyMutationControllerProvider call(
    int key,
  ) =>
      MyMutationControllerProvider._(argument: key, from: this);

  @override
  String toString() => r'myMutationControllerProvider';
}

abstract class _$MyMutationController extends $Notifier<MutationState> {
  late final _$args = ref.$arg as int;
  int get key => _$args;

  MutationState build(
    int key,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<MutationState, MutationState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<MutationState, MutationState>,
        MutationState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
