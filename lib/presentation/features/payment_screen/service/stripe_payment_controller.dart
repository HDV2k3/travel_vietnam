// import 'package:chandoiqua/presentation/features/payment_screen/service/stripe_payment_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// final stripePaymentController =
//     StateNotifierProvider<StripePaymentController, bool>((ref) =>
//         StripePaymentController(
//             ref: ref, stripePaymentService: ref.watch(stripeServiceProvider)));
//
// class StripePaymentController extends StateNotifier<bool> {
//   final Ref _ref;
//   final StripePaymentService _stripePaymentService;
//
//   StripePaymentController(
//       {required Ref ref, required StripePaymentService stripePaymentService})
//       : _ref = ref,
//         _stripePaymentService = stripePaymentService,
//         super(false);
//
//   Future<void> makePayment(BuildContext context, double amount) async {
//     _stripePaymentService.makePayment(context, amount);
//   }
// }