import 'package:chandoiqua/data/models/order.dart';
import 'package:chandoiqua/data/models/usser.dart';
import 'package:chandoiqua/data/services/firebase/order_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final orderControllerProvider =
    StateNotifierProvider<OrderController, bool>((ref) => OrderController(
          ref: ref,
          orderService: ref.watch(ordersServiceProvider),
        ));

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
    UserModel user,
    double total,
  ) async {
    String orderId = const Uuid().v1();

    final order = Orders(
      uid: uid,
      products: user.cart!.toList(),
      total: total,
      orderId: orderId,
      date: DateTime.now(),
      isAccepted: false,
      isCancelled: false,
    );

    final res = await _orderService.createOrder(order);
    state = false;

    res.fold(
      (l) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l.message)),
      ),
      (r) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Order has been placed successfully")),
      ),
    );
  }
}
