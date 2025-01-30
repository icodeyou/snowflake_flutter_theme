// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mutation_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mutationControllerHash() =>
    r'fd79dd796d082a890c1c258ea24349b9f5ec947c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$MutationController
    extends BuildlessAutoDisposeNotifier<MutationState> {
  late final int key;

  MutationState build(
    int key,
  );
}

/// See also [MutationController].
@ProviderFor(MutationController)
const mutationControllerProvider = MutationControllerFamily();

/// See also [MutationController].
class MutationControllerFamily extends Family<MutationState> {
  /// See also [MutationController].
  const MutationControllerFamily();

  /// See also [MutationController].
  MutationControllerProvider call(
    int key,
  ) {
    return MutationControllerProvider(
      key,
    );
  }

  @override
  MutationControllerProvider getProviderOverride(
    covariant MutationControllerProvider provider,
  ) {
    return call(
      provider.key,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'mutationControllerProvider';
}

/// See also [MutationController].
class MutationControllerProvider
    extends AutoDisposeNotifierProviderImpl<MutationController, MutationState> {
  /// See also [MutationController].
  MutationControllerProvider(
    int key,
  ) : this._internal(
          () => MutationController()..key = key,
          from: mutationControllerProvider,
          name: r'mutationControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mutationControllerHash,
          dependencies: MutationControllerFamily._dependencies,
          allTransitiveDependencies:
              MutationControllerFamily._allTransitiveDependencies,
          key: key,
        );

  MutationControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.key,
  }) : super.internal();

  final int key;

  @override
  MutationState runNotifierBuild(
    covariant MutationController notifier,
  ) {
    return notifier.build(
      key,
    );
  }

  @override
  Override overrideWith(MutationController Function() create) {
    return ProviderOverride(
      origin: this,
      override: MutationControllerProvider._internal(
        () => create()..key = key,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        key: key,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<MutationController, MutationState>
      createElement() {
    return _MutationControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MutationControllerProvider && other.key == key;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, key.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MutationControllerRef on AutoDisposeNotifierProviderRef<MutationState> {
  /// The parameter `key` of this provider.
  int get key;
}

class _MutationControllerProviderElement
    extends AutoDisposeNotifierProviderElement<MutationController,
        MutationState> with MutationControllerRef {
  _MutationControllerProviderElement(super.provider);

  @override
  int get key => (origin as MutationControllerProvider).key;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
