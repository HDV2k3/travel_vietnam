import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'favorite_state.dart';

part 'favorite_view_model.g.dart';

@riverpod
class FavoriteViewModel extends _$FavoriteViewModel {
  @override
  FutureOr<FavoriteState> build() {
    return FavoriteState();
  }
}
