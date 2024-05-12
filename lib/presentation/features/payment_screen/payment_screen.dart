import 'package:chandoiqua/data/models/usser.dart';
import 'package:chandoiqua/presentation/features/payment_screen/widgets/selected_payment_method.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/authen_controller.dart';
import '../../controllers/order_controller.dart';
import '../cart_screen/widgets/cart_item.dart';
import '../discovery/widgets/error_text.dart';
import '../discovery/widgets/loader.dart';
import '../payment_process_screen/payment_process_screen.dart';

class PaymentVip extends ConsumerWidget {
  final String payment;

  const PaymentVip({
    super.key,
    this.payment = 'Thanh Toán',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = FirebaseAuth.instance.currentUser;

    final userProvider = ref.watch(getUserDataProvider(currentUser!.uid));
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Center(
              child: Text(
            payment,
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          )),
        ),
        elevation: 0,
      ),
      body: userProvider.when(
          data: (data) {
            return SizedBox(
              height: 1000,
              child: ListView(
                children: [
                  Column(
                    children: data.cart!
                        .map((cartItem) => CartItemWidget(item: cartItem))
                        .toList(),
                  ),
                  const SelectedPaymentMethod(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Total",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "\$${data.grandTotal.toString()}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 50,
                                width: 400,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black),
                                  onPressed: () {
                                    ref
                                        .read(getUserDataProvider(
                                            currentUser.uid))
                                        .whenData((value) {
                                      return ref
                                          .read(
                                              orderControllerProvider.notifier)
                                          .createOrder(context, currentUser.uid,
                                              value, data.grandTotal)
                                          .then((value) => MaterialPageRoute(
                                              builder: (context) =>
                                                  const PaymentProcessScreen()));
                                    });
                                  },
                                  child: const Text(
                                    "Place Order",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          error: (error, stackTrace) => ErrorText(error: error.toString()),
          loading: () => const Loader()),
    );
  }
}
