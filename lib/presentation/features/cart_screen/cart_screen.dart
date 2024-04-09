import 'package:chandoiqua/presentation/features/cart_screen/widgets/buttonDatetime.dart';
import 'package:chandoiqua/presentation/features/cart_screen/widgets/select_date_time.dart';
import 'package:chandoiqua/presentation/features/payment_screen/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerWidget {
  final String image;
  final String title;
  final String price;
  final String cart;
  final String location;
  const CartScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      this.cart = "Đặt Chuyến",
      required this.location});
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
            Positioned(
              left: 15,
              top: 180,
              right: 15,
              child: Container(
                width: 500,
                height: 400,
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
                            fontWeight: FontWeight.bold, fontSize: 25,color: Colors.amberAccent),
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
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: SizedBox(
                        child: Text(
                          '"Khám phá những hành trình vô tận - Hòa mình cùng cuộc sống"',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
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
                  // borderRadius: BorderRadius.only(
                  //   bottomRight: Radius.circular(20),
                  //   topRight: Radius.circular(20),
                  //   bottomLeft: Radius.circular(20),
                  //   topLeft: Radius.circular(20),
                  // ),
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
                            price,
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
                                              price: price,
                                            )));
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
}
