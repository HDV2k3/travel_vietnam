import 'package:chandoiqua/presentation/features/cart_screen/widgets/buttonDatetime.dart';
import 'package:chandoiqua/presentation/features/cart_screen/widgets/select_date_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerWidget {
  final String image;
  final String title;
  final String price;
  final String cart;
  final String location;
  const CartScreen(
      {Key? key,
      required this.image,
      required this.title,
      required this.price,
      this.cart = "Giỏ Hàng",
      required this.location})
      : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(cart)),
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
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(
                      20,
                    ),
                    topLeft: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(image),
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
                height: 150,
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
                              location,
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
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black54.withOpacity(1),
                          ),
                        ),
                        const Text(
                          '....................',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          price,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 50,
              top: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chọn Ngày Và Giờ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ],
              ),
            ),
            const Positioned(
              top: 250,
              right: 10,
              child: Column(
                children: [
                  Row(
                    children: [

                      SizedBox(
                        child: ButtonDateTime(
                          category: 'Hôm Nay',
                          color: Colors.black,
                          background: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                        child: ButtonDateTime(
                          category: 'Ngày Mai',
                          color: Colors.black,
                          background: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Positioned(
              top: 320,
              right: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                      SizedBox(
                        child: SelectDateTime()
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
