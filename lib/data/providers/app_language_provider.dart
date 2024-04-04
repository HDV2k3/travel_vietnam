import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'shared_preferences_repository_provider.dart';

part 'app_language_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [sharedPreferencesRepository])
class AppLanguage extends _$AppLanguage {
  @override
  String build() {
    return ref.watch(sharedPreferencesRepositoryProvider).getLanguageSetting();
  }

  void onChanged(String value) {
    ref.read(sharedPreferencesRepositoryProvider).saveLanguageSetting(value);
    state = value;
  }
}
