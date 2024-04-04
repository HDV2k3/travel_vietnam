import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'shared_preferences_repository_provider.dart';

part 'app_theme_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [sharedPreferencesRepository])
class AppTheme extends _$AppTheme {
  @override
  bool build() {
    return ref.watch(sharedPreferencesRepositoryProvider).getIsDarkTheme();
  }

  void onToggle() {
    final newValue = !state;
    ref.read(sharedPreferencesRepositoryProvider).saveIsDarkTheme(newValue);
    state = newValue;
  }
}
