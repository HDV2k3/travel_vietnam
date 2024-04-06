// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoriteButtonIconHash() =>
    r'2ca1bcb9d9e671d141e9d70df47d007e637a5f06';

/// See also [FavoriteButtonIcon].
@ProviderFor(FavoriteButtonIcon)
final favoriteButtonIconProvider =
    NotifierProvider<FavoriteButtonIcon, IconData>.internal(
  FavoriteButtonIcon.new,
  name: r'favoriteButtonIconProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteButtonIconHash,
  dependencies: <ProviderOrFamily>[sharedPreferencesRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    sharedPreferencesRepositoryProvider,
    ...?sharedPreferencesRepositoryProvider.allTransitiveDependencies
  },
);

typedef _$FavoriteButtonIcon = Notifier<IconData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
