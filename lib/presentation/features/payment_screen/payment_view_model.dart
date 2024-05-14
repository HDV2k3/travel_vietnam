import 'package:chandoiqua/data/models/order.dart';
import 'package:chandoiqua/data/models/usser.dart';
import 'package:chandoiqua/data/repositories/order_repository.dart';
import 'package:chandoiqua/presentation/features/payment_screen/payment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'payment_view_model.g.dart';

class OrderController extends StateNotifier<bool> {
  final OrderRepository _orderService;

  OrderController({required Ref ref, required OrderRepository orderService})
      : _orderService = orderService,
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

    final res = _orderService.createOrder(order);
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

@riverpod
class PaymentViewModel extends _$PaymentViewModel {
  @override
  FutureOr<PaymentState> build() {
    return PaymentState();
  }

  void onPaymentMethodChanged(int index) {
    update(
      (state) => state.copyWith(
        selectedTabPaymentMethod: index,
      ),
    );
  }
}
