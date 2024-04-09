// import 'package:chandoiqua/presentation/features/payment_screen/payment_screen.dart';
// import 'package:flutter/material.dart';
//
// class ButtonConfirmTrip extends StatefulWidget {
//   final String category;
//   final Color color;
//   final String price;
//
//   const ButtonConfirmTrip({
//     super.key,
//     required this.category, required this.color, required this.price
//   });
//
//   @override
//   State<ButtonConfirmTrip> createState() => _ButtonConfirmTripState();
// }
//
// class _ButtonConfirmTripState extends State<ButtonConfirmTrip> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 180,
//       height: 50,
//       child: ElevatedButton(
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>const Payment()));
//
//
//         },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.blue,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//         ),
//         child:  Text(widget.category,style: TextStyle(color: widget.color),),
//       ),
//     );
//   }
// }
