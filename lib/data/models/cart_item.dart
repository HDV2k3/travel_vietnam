import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

List<CartItem> cartFromJson(dynamic str) =>
    List<CartItem>.from((str).map((e) => CartItem.fromJson(e)));

@freezed
abstract class CartItem with _$CartItem {
  factory CartItem({
    required String cartId,
    required String image,
    // required String productId,
    required String name,
    required int quantity,
    required double cost,
    required double price,
    required String numberOfBeds,
    required String area, // Kiểu List<dynamic> cho danh sách tiện ích
    required String view,
    required String regulations,
  }) = _CartItem;
  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}
