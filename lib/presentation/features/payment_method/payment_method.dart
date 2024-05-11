// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import '../../controllers/authen_controller.dart';
// import '../cart_screen/widgets/cart_item.dart';
// import '../discovery/widgets/error_text.dart';
// import '../discovery/widgets/loader.dart';
//
// class PaymentMethod extends StatefulWidget {
//   const PaymentMethod({super.key});
//
//   @override
//   State<PaymentMethod> createState() => _PaymentMethodState();
// }
//
// class _PaymentMethodState extends State<PaymentMethod> {
//   int type = 1;
//   void handRadio(Object? e) => setState(() {
//         super.initState();
//       });
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     final currentUser = FirebaseAuth.instance.currentUser;
//
//     final userProvider = ref.watch(getUserDataProvider(currentUser!.uid));
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//             child: Text(
//           payment,
//           style: const TextStyle(
//               color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
//         )),
//         elevation: 0,
//       ),
//       body: userProvider.when(
//           data: (data) {
//             return SizedBox(
//               height: MediaQuery.of(context).size.height * 0.8,
//               child: ListView(
//                 children: [
//                   Column(
//                     children: data.cart!
//                         .map((cartItem) => CartItemWidget(item: cartItem))
//                         .toList(),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: Center(
//                       child: Column(
//                         children: [
//                           const SizedBox(
//                             height: 40,
//                           ),
//                           Container(
//                             width: size.width,
//                             height: 55,
//                             decoration: BoxDecoration(
//                                 border: type == 1
//                                     ? Border.all(width: 1, color: Colors.black)
//                                     : Border.all(
//                                         width: 0.3, color: Colors.grey),
//                                 borderRadius: BorderRadius.circular(5),
//                                 color: Colors.transparent),
//                             child: Center(
//                               child: Padding(
//                                 padding: const EdgeInsets.only(right: 20),
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Radio(
//                                           value: 1,
//                                           groupValue: type,
//                                           onChanged: handRadio,
//                                           activeColor: const Color(0xFFDB3022),
//                                         ),
//                                         Text(
//                                           'Amazon Pay ',
//                                           style: type == 1
//                                               ? const TextStyle(
//                                                   fontSize: 15,
//                                                   fontWeight: FontWeight.w500,
//                                                   color: Colors.black,
//                                                 )
//                                               : const TextStyle(
//                                                   fontSize: 15,
//                                                   fontWeight: FontWeight.w500,
//                                                   color: Colors.grey,
//                                                 ),
//                                         ),
//                                       ],
//                                     ),
//                                     Image.asset(
//                                       '',
//                                       width: 70,
//                                       height: 70,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   // Padding(
//                   //   padding: const EdgeInsets.all(8.0),
//                   //   child: Row(
//                   //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //     children: [
//                   //       const Text(
//                   //         "Total",
//                   //         style: TextStyle(
//                   //             color: Colors.black,
//                   //             fontSize: 20,
//                   //             fontWeight: FontWeight.bold),
//                   //       ),
//                   //       Text(
//                   //         "\$${data.grandTotal.toString()}",
//                   //         style: const TextStyle(
//                   //             color: Colors.black,
//                   //             fontWeight: FontWeight.bold,
//                   //             fontSize: 15),
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),
//                   // Center(
//                   //   child: Padding(
//                   //     padding: const EdgeInsets.all(8.0),
//                   //     child: SizedBox(
//                   //       height: 50,
//                   //       width: 400,
//                   //       child: ElevatedButton(
//                   //         style: ElevatedButton.styleFrom(
//                   //             backgroundColor: Colors.black),
//                   //         onPressed: () {
//                   //           ref
//                   //               .read(getUserDataProvider(currentUser!.uid))
//                   //               .whenData((value) {
//                   //             return ref
//                   //                 .read(orderControllerProvider.notifier)
//                   //                 .createOrder(context, currentUser.uid, value,
//                   //                     data.grandTotal)
//                   //                 .then((value) {
//                   //               ref
//                   //                   .read(stripePaymentController.notifier)
//                   //                   .makePayment(context, data.grandTotal)
//                   //                   .then((value) => MaterialPageRoute(
//                   //                       builder: (context) =>
//                   //                           const PaymentProcessScreen()));
//                   //             });
//                   //           });
//                   //         },
//                   //         child: const Text(
//                   //           "Place Order",
//                   //           style: TextStyle(
//                   //               color: Colors.white,
//                   //               fontWeight: FontWeight.bold),
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ),
//                   // )
//                 ],
//               ),
//             );
//           },
//           error: (error, stackTrace) => ErrorText(error: error.toString()),
//           loading: () => const Loader()),
//     );
//   }
// }
