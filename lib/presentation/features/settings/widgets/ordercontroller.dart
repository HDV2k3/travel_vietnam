import 'package:chandoiqua/data/repositories/order_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/models/order.dart';
import '../../../../data/providers/order_provider.dart';

final orderControllerProvider = StateNotifierProvider<OrderController, bool>(
    (ref) => OrderController(
        ref: ref, orderService: ref.watch(ordersServiceProvider)));
final getUserOrders = StreamProvider.family((ref, String userId) {
  final orders =
      ref.watch(orderControllerProvider.notifier).getUserOrders(userId);
  return orders;
});

class OrderController extends StateNotifier<bool> {
  final OrderRepository _orderService;

  OrderController({required Ref ref, required OrderRepository orderService})
      : _orderService = orderService,
        super(false);

  Stream<List<Orders>> getUserOrders(String userId) {
    return _orderService.getUserOrders(userId);
  }
}
