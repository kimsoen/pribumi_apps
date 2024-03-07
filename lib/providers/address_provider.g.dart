// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addressHash() => r'9c0d93e3f85997f8764e65bfc11a1ebcf0e5a987';

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

/// See also [address].
@ProviderFor(address)
const addressProvider = AddressFamily();

/// See also [address].
class AddressFamily extends Family<AsyncValue<String?>> {
  /// See also [address].
  const AddressFamily();

  /// See also [address].
  AddressProvider call({
    required Position? position,
  }) {
    return AddressProvider(
      position: position,
    );
  }

  @override
  AddressProvider getProviderOverride(
    covariant AddressProvider provider,
  ) {
    return call(
      position: provider.position,
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
  String? get name => r'addressProvider';
}

/// See also [address].
class AddressProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [address].
  AddressProvider({
    required Position? position,
  }) : this._internal(
          (ref) => address(
            ref as AddressRef,
            position: position,
          ),
          from: addressProvider,
          name: r'addressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addressHash,
          dependencies: AddressFamily._dependencies,
          allTransitiveDependencies: AddressFamily._allTransitiveDependencies,
          position: position,
        );

  AddressProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.position,
  }) : super.internal();

  final Position? position;

  @override
  Override overrideWith(
    FutureOr<String?> Function(AddressRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddressProvider._internal(
        (ref) => create(ref as AddressRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        position: position,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _AddressProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddressProvider && other.position == position;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, position.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddressRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `position` of this provider.
  Position? get position;
}

class _AddressProviderElement extends AutoDisposeFutureProviderElement<String?>
    with AddressRef {
  _AddressProviderElement(super.provider);

  @override
  Position? get position => (origin as AddressProvider).position;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
