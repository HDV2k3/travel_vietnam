// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_box_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$checkBoxHash() => r'f6bfc01b1732f1da18703e2384d6196acf06f80e';

/// See also [CheckBox].
@ProviderFor(CheckBox)
final checkBoxProvider = NotifierProvider<CheckBox, bool>.internal(
  CheckBox.new,
  name: r'checkBoxProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$checkBoxHash,
  dependencies: <ProviderOrFamily>[sharedPreferencesRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    sharedPreferencesRepositoryProvider,
    ...?sharedPreferencesRepositoryProvider.allTransitiveDependencies
  },
);

typedef _$CheckBox = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
