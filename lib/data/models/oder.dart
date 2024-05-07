import 'package:chandoiqua/data/models/room_in_hotel.dart';
import 'package:chandoiqua/data/models/usser.dart';
import 'package:ephamarcy/models/address.dart';
import 'package:ephamarcy/models/cartitem.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'cart_item.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
abstract class Orders with _$Orders {
  @JsonSerializable(explicitToJson: true)
  factory Orders(
      {String? uid,
      required List<CartItem> products,
      required double total,
      required String orderId,
      required User fullNameInOrder,
      required String dayStart,
      required String dayEnd,
      required Room nameRoomInOrder,
      required User emailUser,
      required User phoneUser,
      bool? isAccepted,
      bool? isDelivered,
      bool? isCancelled,
      required DateTime date}) = _Orders;
  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);
}
