import 'package:chandoiqua/data/models/room_in_hotel.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

import '../models/cart_item.dart';

abstract class CartInterface {
  Either<dynamic, Future<void>> addProductToCart(
      Room hotel, BuildContext context);
  Either<dynamic, Future<void>> removeCartItem(CartItem cartItem);
  Future<void> clearCart();
  void decreaseQuantity(CartItem item);
}
