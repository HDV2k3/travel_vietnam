import 'dart:async';

import 'package:chandoiqua/data/models/usser.dart';
import 'package:chandoiqua/presentation/common_widgets/base/base_screen.dart';
import 'package:chandoiqua/presentation/features/payment_screen/payment_state.dart';
import 'package:chandoiqua/presentation/features/payment_screen/payment_view_model.dart';
import 'package:chandoiqua/utilities/extensions/widget_ref_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import '../../../data/providers/authen_provider.dart';
import '../../../data/providers/cart_provider.dart';
import '../../../data/providers/order_provider.dart';
import '../../payment_failed/payment_failed.dart';
import '../cart_screen/widgets/cart_item.dart';
import '../discovery/widgets/error_text.dart';
import '../discovery/widgets/loader.dart';
import '../payment_process_screen/payment_process_screen.dart';

class PaymentVip extends BaseScreen {
  const PaymentVip({super.key});

  @override
  BaseScreenState createState() => _PaymentVipScreenState();
}

class _PaymentVipScreenState
    extends BaseScreenState<PaymentVip, PaymentViewModel, PaymentState> {
  Timer? _timer;
  int _start = 60;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PaymentFailed(),
            ),
          );
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  Color? get backgroundColor => ref.colors.background;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return null;
  }

  @override
  Widget buildBody(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return const Center(
        child: Text(
          'User is not logged in',
          style: TextStyle(color: Colors.red, fontSize: 18),
        ),
      );
    }

    final userProvider = ref.watch(getUserDataProvider(currentUser.uid));
    final cart = ref.watch(cartControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            cart.clearCart();
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 60),
          child: Center(
            child: Text(
              ref.appLocalizations.thanhToan,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
                // PaymentScreen(),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Time remaining: $_start seconds',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ref.appLocalizations.tongTien,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "\$${data.grandTotal.toString()}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
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
                                  backgroundColor: Colors.black,
                                ),
                                onPressed: () {
                                  ref
                                      .read(
                                          getUserDataProvider(currentUser.uid))
                                      .whenData((value) {
                                    return ref
                                        .read(orderControllerProvider.notifier)
                                        .createOrder(
                                          context,
                                          currentUser.uid,
                                          value,
                                          data.grandTotal,
                                        )
                                        .then((value) => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const PaymentProcessScreen(),
                                              ),
                                            ));
                                  });
                                  cart.clearCart();
                                },
                                child: Text(
                                  ref.appLocalizations.thanhToan,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
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
        loading: () => const Loader(),
      ),
    );
  }

  @override
  AsyncValue<PaymentState> get state => ref.watch(paymentViewModelProvider);

  @override
  PaymentViewModel get viewModel => ref.read(paymentViewModelProvider.notifier);
}
