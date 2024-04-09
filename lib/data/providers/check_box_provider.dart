import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'shared_preferences_repository_provider.dart';

part 'check_box_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [sharedPreferencesRepository])
class CheckBox extends _$CheckBox {
  @override
  bool build() {
    return ref.watch(sharedPreferencesRepositoryProvider).getIsCheckBox();
  }

  void onToggle() {
    final newValue = !state;
    ref.read(sharedPreferencesRepositoryProvider).saveIsCheckBox(newValue);
    state = newValue;
  }
}
