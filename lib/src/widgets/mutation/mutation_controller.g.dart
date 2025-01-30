// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mutation_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mutationControllerHash() =>
    r'00effaaa29f288006e0e045fe9999fa8addb5a1e';

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
  late final int hashCode;

  MutationState build(
    int hashCode,
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
    int hashCode,
  ) {
    return MutationControllerProvider(
      hashCode,
    );
  }

  @override
  MutationControllerProvider getProviderOverride(
    covariant MutationControllerProvider provider,
  ) {
    return call(
      provider.hashCode,
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
    int hashCode,
  ) : this._internal(
          () => MutationController()..hashCode = hashCode,
          from: mutationControllerProvider,
          name: r'mutationControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mutationControllerHash,
          dependencies: MutationControllerFamily._dependencies,
          allTransitiveDependencies:
              MutationControllerFamily._allTransitiveDependencies,
          hashCode: hashCode,
        );

  MutationControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.hashCode,
  }) : super.internal();

  final int hashCode;

  @override
  MutationState runNotifierBuild(
    covariant MutationController notifier,
  ) {
    return notifier.build(
      hashCode,
    );
  }

  @override
  Override overrideWith(MutationController Function() create) {
    return ProviderOverride(
      origin: this,
      override: MutationControllerProvider._internal(
        () => create()..hashCode = hashCode,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        hashCode: hashCode,
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
    return other is MutationControllerProvider && other.hashCode == hashCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hashCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MutationControllerRef on AutoDisposeNotifierProviderRef<MutationState> {
  /// The parameter `hashCode` of this provider.
  int get hashCode;
}

class _MutationControllerProviderElement
    extends AutoDisposeNotifierProviderElement<MutationController,
        MutationState> with MutationControllerRef {
  _MutationControllerProviderElement(super.provider);

  @override
  int get hashCode => (origin as MutationControllerProvider).hashCode;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
