import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'shared_preferences_repository_provider.dart';

part 'favorite_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [sharedPreferencesRepository])
class Favorite extends _$Favorite {
  @override
  bool build() {
    return ref.watch(sharedPreferencesRepositoryProvider).getIsFavorite();
  }
  void onToggle() {
    final newValue = !state;
    ref.read(sharedPreferencesRepositoryProvider).saveIsFavorite(newValue);
    state = newValue;
  }

}
