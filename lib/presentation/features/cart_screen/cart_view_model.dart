import 'package:chandoiqua/data/models/room_in_hotel.dart';
import 'package:chandoiqua/data/repositories/cart_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/models/cart_item.dart';
import 'cart_state.dart';

part 'cart_view_model.g.dart';

class CartProductViewModel extends StateNotifier<bool> {
  final CartRepository _cartService;

  CartProductViewModel({required CartRepository cartService, required Ref ref})
      : _cartService = cartService,
        super(false);

  void addProductToCart(Room product, BuildContext context) {
    _cartService.addProductToCart(product, context).fold(
        (l) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l.toString()))),
        (r) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${product.name} added to cart"))));
  }

  void removeCartItem(CartItem item, BuildContext context) {
    _cartService.removeCartItem(item).fold(
        (l) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l.toString()))),
        (r) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${item.name} removed from cart"))));
  }

  void decreaseQuantity(CartItem item) {
    _cartService.decreaseQuantity(item);
  }

  // void increaseQuantity(CartItem item) {
  //   _cartService.increaseQuantity(item);
  // }

  Future<void> clearCart() async {
    return _cartService.clearCart();
  }
}

@riverpod
class CartViewModel extends _$CartViewModel {
  @override
  FutureOr<CartState> build() {
    return CartState();
  }
}
