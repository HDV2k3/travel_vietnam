import 'package:chandoiqua/presentation/common_widgets/base/base_screen.dart';
import 'package:chandoiqua/presentation/features/cart_screen/cart_state.dart';
import 'package:chandoiqua/presentation/features/cart_screen/cart_view_model.dart';
import 'package:chandoiqua/utilities/extensions/widget_ref_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends BaseScreen {
  final String cart;

  const CartScreen({
    super.key,
    this.cart = "Đặt Chuyến",
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartScreenSate();
}

class _CartScreenSate
    extends BaseScreenState<CartScreen, CartViewModel, CartState> {
  @override
  Color? get backgroundColor => ref.colors.background;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(widget.cart),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return const SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: SingleChildScrollView(
        child: Stack(
          children: [],
        ),
      ),
    );
  }

  @override
  // TODO: implement state
  AsyncValue<CartState> get state => ref.watch(cartViewModelProvider);

  @override
  // TODO: implement viewModel
  CartViewModel get viewModel => ref.read(cartViewModelProvider.notifier);
}
