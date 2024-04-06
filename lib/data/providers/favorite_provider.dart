import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'shared_preferences_repository_provider.dart';

part 'favorite_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [sharedPreferencesRepository])
class FavoriteButtonIcon extends _$FavoriteButtonIcon {
  @override
  IconData build() {
    return ref.watch(sharedPreferencesRepositoryProvider).getFavorite();
  }

  void onToggle() {
    final newValue = state;
    ref.read(sharedPreferencesRepositoryProvider).saveFavorite(newValue);
    state = newValue;
  }
}
