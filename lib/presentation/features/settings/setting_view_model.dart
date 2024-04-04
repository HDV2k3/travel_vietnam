import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'setting_state.dart';

part 'setting_view_model.g.dart';

@riverpod
class SettingViewModel extends _$SettingViewModel {
  @override
  FutureOr<SettingState> build() {
    return SettingState();
  }
}
