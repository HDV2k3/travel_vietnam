// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appThemeHash() => r'4c15836556c89e6e01b9e639818d00cec8b8ee00';

/// See also [AppTheme].
@ProviderFor(AppTheme)
final appThemeProvider = NotifierProvider<AppTheme, bool>.internal(
  AppTheme.new,
  name: r'appThemeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appThemeHash,
  dependencies: <ProviderOrFamily>[sharedPreferencesRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    sharedPreferencesRepositoryProvider,
    ...?sharedPreferencesRepositoryProvider.allTransitiveDependencies
  },
);

typedef _$AppTheme = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
