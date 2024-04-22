// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoriteHash() => r'ea8311f588cbda01d446f6b6321f4e2065978696';

/// See also [Favorite].
@ProviderFor(Favorite)
final favoriteProvider = NotifierProvider<Favorite, bool>.internal(
  Favorite.new,
  name: r'favoriteProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$favoriteHash,
  dependencies: <ProviderOrFamily>[sharedPreferencesRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    sharedPreferencesRepositoryProvider,
    ...?sharedPreferencesRepositoryProvider.allTransitiveDependencies
  },
);

typedef _$Favorite = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
