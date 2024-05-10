import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/models/cart_item.dart';
import '../../../controllers/cart_controller.dart';

class CartItemWidget extends ConsumerWidget {
  final CartItem item;

  const CartItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartControllerProvider.notifier);
    return SizedBox(
      height: 800,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, top: 20, left: 20),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
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
                  Row(
                    children: [
                      Text('${item.area}m²'),
                      const SizedBox(
                        width: 20,
                      ),
                      Text('view: ${item.view}'),
                      const SizedBox(
                        width: 20,
                      ),
                      Text('quy định: ${item.regulations}'),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              left: 290,
              child: Container(
                height: 200,
                width: 100,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          cart.clearCart();
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.delete))
                  ],
                ),
              ),
            ),
            Positioned(
              top: 250,
              child: Container(
                height: 50,
                width: 400,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text('Thanh toán trước trực tuyến',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                          Text(
                            item.price.toString(),
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
