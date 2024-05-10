// import 'package:chandoiqua/presentation/common_widgets/base/base_screen.dart';
// import 'package:chandoiqua/presentation/features/cart_screen/cart_state.dart';
// import 'package:chandoiqua/presentation/features/cart_screen/cart_view_model.dart';
// import 'package:chandoiqua/presentation/features/cart_screen/widgets/cart_item.dart';
// import 'package:chandoiqua/presentation/features/discovery/discovery_screen.dart';
// import 'package:chandoiqua/utilities/extensions/widget_ref_extension.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../controllers/authen_controller.dart';
// import '../../controllers/cart_controller.dart';
// import '../discovery/widgets/error_text.dart';
// import '../discovery/widgets/loader.dart';
//
// class CartScreen extends BaseScreen {
//   final String cart;
//   const CartScreen({
//     super.key,
//     this.cart = "Booking",
//   });
//
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _CartScreenSate();
// }
//
// class _CartScreenSate
//     extends BaseScreenState<CartScreen, CartViewModel, CartState> {
//   @override
//   Color? get backgroundColor => ref.colors.background;
//
//   @override
//   PreferredSizeWidget? buildAppBar(BuildContext context) {
//     final cart = ref.watch(cartControllerProvider.notifier);
//     return AppBar(
//       automaticallyImplyLeading: false,
//       leading: IconButton(
//         onPressed: () {
//           cart.clearCart();
//           Navigator.pop(context);
//         },
//         icon: const Icon(Icons.arrow_back),
//       ),
//       title: Text(widget.cart),
//     );
//   }
//
//   @override
//   Widget buildBody(BuildContext context) {
//     final currentUser = FirebaseAuth.instance.currentUser;
//     final userProvider = ref.watch(getUserDataProvider(currentUser!.uid));
//     return Scaffold(
//       body: userProvider.when(
//         data: (data) {
//           return data.cart != null
//               ? ListView.builder(
//                   itemCount: data.cart!.length,
//                   itemBuilder: (context, index) {
//                     final cartItem = data.cart![index];
//                     return CartItemWidget(item: cartItem);
//                   },
//                 )
//               : Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Center(child: Text("Cart Is Empty")),
//                       const SizedBox(height: 8),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const DiscoveryScreen(),
//                             ),
//                           );
//                         },
//                         child: const Center(
//                           child: Text(
//                             "Back To Discovery",
//                             style: TextStyle(
//                               color: Colors.orange,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 15,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//         },
//         error: (error, stackTrace) => ErrorText(error: error.toString()),
//         loading: () => const Loader(),
//       ),
//     );
//   }
//
//   @override
//   // TODO: implement state
//   AsyncValue<CartState> get state => ref.watch(cartViewModelProvider);
//
//   @override
//   // TODO: implement viewModel
//   CartViewModel get viewModel => ref.read(cartViewModelProvider.notifier);
// }
