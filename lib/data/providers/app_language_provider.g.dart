// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_language_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appLanguageHash() => r'd6f8f5d08dc02f34a11e75cee204783bb10c27d8';

/// See also [AppLanguage].
@ProviderFor(AppLanguage)
final appLanguageProvider = NotifierProvider<AppLanguage, String>.internal(
  AppLanguage.new,
  name: r'appLanguageProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appLanguageHash,
  dependencies: <ProviderOrFamily>[sharedPreferencesRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    sharedPreferencesRepositoryProvider,
    ...?sharedPreferencesRepositoryProvider.allTransitiveDependencies
  },
);

typedef _$AppLanguage = Notifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
