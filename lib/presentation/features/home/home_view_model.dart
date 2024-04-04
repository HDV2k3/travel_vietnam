import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'home_state.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  FutureOr<HomeState> build() {
    return HomeState();
  }

  void onTabChanged(int index) {
    update(
      (state) => state.copyWith(
        selectedTabIndex: index,
      ),
    );
  }
}
