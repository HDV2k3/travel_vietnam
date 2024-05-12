// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// class PassengerInfoFormWidget extends ConsumerWidget {
//   const PassengerInfoFormWidget({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // Declare TextEditingController for each input field
//     final nameController = TextEditingController();
//     final emailController = TextEditingController();
//     final phoneNumberController = TextEditingController();
//
//     // Handle form submission
//     void submitForm() {
//       final name = nameController.text;
//       final email = emailController.text;
//       final phoneNumber = phoneNumberController.text;
//
//       // Do something with the submitted data
//       // e.g., send it to an API, save to a database, etc.
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Passenger Info'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(
//                 labelText: 'Name',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: emailController,
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: phoneNumberController,
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(
//                 labelText: 'Phone Number',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: submitForm,
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
