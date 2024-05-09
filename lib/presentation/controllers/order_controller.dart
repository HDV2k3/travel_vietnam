import 'package:chandoiqua/data/models/room_in_hotel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../data/models/order.dart';
import '../../data/models/usser.dart';
import '../../data/services/firebase/order_service.dart';

final orderControllerProvider = StateNotifierProvider<OrderController, bool>(
    (ref) => OrderController(
        ref: ref, orderService: ref.watch(ordersServiceProvider)));
final getUserOrders = StreamProvider.family((ref, String userId) {
  final orders =
      ref.watch(orderControllerProvider.notifier).getUserOrders(userId);
  return orders;
});

class OrderController extends StateNotifier<bool> {
  final Ref _ref;
  final OrderService _orderService;
  OrderController({required Ref ref, required OrderService orderService})
      : _ref = ref,
        _orderService = orderService,
        super(false);

  Future<void> createOrder(
      BuildContext context,
      String uid,
      UserModel email,
      UserModel phone,
      UserModel user,
      double total,
      UserModel fullName,
      Room nameRoomInOrder) async {
    String orderId = const Uuid().v1();

    final order = Orders(
      uid: uid,
      products: user.cart!.toList(),
      total: total,
      orderId: orderId,
      date: DateTime.now(),
      isAccepted: false,
      isCancelled: false,
      fullName: fullName,
      emailUser: email,
      phoneUser: phone,
      nameRoomInOrder: nameRoomInOrder,
    );
    final res = _orderService.createOrder(order);
    state = false;

    res.fold(
        (l) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l.message))),
        (r) => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Order has been placed successfully"))));
  }

  Stream<List<Orders>> getUserOrders(String userId) {
    return _orderService.getUserOrders(userId);
  }
}
