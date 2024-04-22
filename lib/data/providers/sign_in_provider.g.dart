// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signInRepositoryHash() => r'da75176d3325c781ead9d6fa321cf753e761e90a';

/// See also [signInRepository].
@ProviderFor(signInRepository)
final signInRepositoryProvider = Provider<SignInRepository>.internal(
  signInRepository,
  name: r'signInRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signInRepositoryHash,
  dependencies: <ProviderOrFamily>[sharedPreferencesClientProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    sharedPreferencesClientProvider,
    ...?sharedPreferencesClientProvider.allTransitiveDependencies
  },
);

typedef SignInRepositoryRef = ProviderRef<SignInRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
