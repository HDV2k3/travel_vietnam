import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'cart_state.dart';

part 'cart_view_model.g.dart';

@riverpod
class CartViewModel extends _$CartViewModel {
  @override
  FutureOr<CartState> build() {
    return CartState();
  }
}
