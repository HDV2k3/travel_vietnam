// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_preferences_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPreferencesRepositoryHash() =>
    r'5df770c87a59500705e5abe5441e285968e19819';

/// See also [sharedPreferencesRepository].
@ProviderFor(sharedPreferencesRepository)
final sharedPreferencesRepositoryProvider =
    Provider<SharedPreferencesRepository>.internal(
  sharedPreferencesRepository,
  name: r'sharedPreferencesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sharedPreferencesRepositoryHash,
  dependencies: <ProviderOrFamily>[sharedPreferencesClientProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    sharedPreferencesClientProvider,
    ...?sharedPreferencesClientProvider.allTransitiveDependencies
  },
);

typedef SharedPreferencesRepositoryRef
    = ProviderRef<SharedPreferencesRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
