import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/models/cart_item.dart';

class OrderItemWidget extends ConsumerWidget {
  CartItem item;
  OrderItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.network(
              item.image.replaceAll('[', '').replaceAll(']', ''),
              fit: BoxFit.cover,
              height: 200,
              width: 290,
            ),
          ),
        ),
        Text(
          item.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
