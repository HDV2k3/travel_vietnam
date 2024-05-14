import 'package:chandoiqua/data/models/order.dart';
import 'package:fpdart/fpdart.dart';

abstract class OrderInterface {
  Either<dynamic, Future<void>> createOrder(Orders order);
}
