import 'package:flutter/material.dart';

import 'MethodChannel.dart'; // Adjust the import to match your file structure

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  void _initiatePayment(BuildContext context) async {
    String orderId =
        "8fba3580-cf86-1ff5-a4ad-f13631e56629"; // Replace with actual order ID
    String result = await ZaloPay.pay(orderId);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(result)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _initiatePayment(context),
      child: const Text('Pay with ZaloPay'),
    );
  }
}
