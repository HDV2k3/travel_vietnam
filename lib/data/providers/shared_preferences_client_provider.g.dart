// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_preferences_client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPreferencesClientHash() =>
    r'ec2b1d46ac37d16a1264eba75ba1eecb896c5f54';

/// See also [sharedPreferencesClient].
@ProviderFor(sharedPreferencesClient)
final sharedPreferencesClientProvider =
    Provider<SharedPreferencesClient>.internal(
  sharedPreferencesClient,
  name: r'sharedPreferencesClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sharedPreferencesClientHash,
  dependencies: <ProviderOrFamily>[sharedPreferencesProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    sharedPreferencesProvider,
    ...?sharedPreferencesProvider.allTransitiveDependencies
  },
);

typedef SharedPreferencesClientRef = ProviderRef<SharedPreferencesClient>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
