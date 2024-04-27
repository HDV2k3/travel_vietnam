import 'package:chandoiqua/presentation/common_widgets/base/base_screen.dart';
import 'package:chandoiqua/presentation/features/cart_screen/cart_state.dart';
import 'package:chandoiqua/presentation/features/cart_screen/cart_view_model.dart';
import 'package:chandoiqua/presentation/features/cart_screen/widgets/button_datetime.dart';
import 'package:chandoiqua/presentation/features/cart_screen/widgets/select_date_time.dart';
import 'package:chandoiqua/presentation/features/payment_screen/payment_screen.dart';
import 'package:chandoiqua/utilities/extensions/widget_ref_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends BaseScreen {
  final String image;
  final String title;
  final String price;
  final String cart;
  final String location;
  final int numPeople;
  const CartScreen(
      {super.key,
      required this.numPeople,
      required this.image,
      required this.title,
      required this.price,
      this.cart = "Đặt Chuyến",
      required this.location});

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
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              left: 15,
              top: 20,
              child: Container(
                width: 150,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(
                      20,
                    ),
                    topLeft: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 20,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 100, top: 30),
                width: 250,
                height: 200,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              size: 15,
                              Icons.location_on,
                              color: Colors.blue,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.location,
                              style: TextStyle(
                                  color: Colors.black54.withOpacity(0.8),
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black54.withOpacity(1),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.7,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${widget.price} \$',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.blue,
                          ),
                        ),
                        Text('${widget.numPeople} Người'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 15,
              top: 230,
              right: 15,
              child: Container(
                width: 500,
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Chọn Ngày Nghĩ Dưỡng',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.amberAccent),
                      ),
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: ButtonDay(
                            category: 'Hôm Nay',
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          child: ButtonDay(
                            category: 'Ngày Mai',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: SizedBox(
                        child: SelectDateTime(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 15,
              top: 600,
              right: 15,
              child: Container(
                width: 250,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50, left: 0),
                      child: Row(
                        children: [
                          const Text(
                            'Tổng Tiền:',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${widget.price} \$',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          SizedBox(
                            width: 180,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Payment(
                                      price: widget.price,
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Text(
                                'Xác Nhận',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
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

  @override
  // TODO: implement state
  AsyncValue<CartState> get state => ref.watch(cartViewModelProvider);

  @override
  // TODO: implement viewModel
  CartViewModel get viewModel => ref.read(cartViewModelProvider.notifier);
}
