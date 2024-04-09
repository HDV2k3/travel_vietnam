import 'package:chandoiqua/presentation/features/detail_screen_discovery/widgets/button.dart';
import 'package:chandoiqua/presentation/features/detail_screen_discovery/widgets/responsive_button.dart';
import 'package:flutter/material.dart';

import '../cart_screen/cart_screen.dart';

class DetailPage extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final String price;
  final String location;
  final String vote;
  final String nation;

  const DetailPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.location,
    required this.vote,
    required this.nation,
  });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int star1 = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nation),
      ),
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.network(widget.image).image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Positioned(
            //   left: 10,
            //   top: 10,
            //   child: Row(
            //     children: [
            //       IconButton(
            //         onPressed: () {},
            //         icon: const Icon(Icons.menu),
            //         color: Colors.white,
            //       ),
            //     ],
            //   ),
            // ),
            Positioned(
              top: 280,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black54.withOpacity(0.8),
                          ),
                        ),
                        Text(
                          widget.price,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.deepPurple,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.location,
                          style: const TextStyle(
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index < star1
                                  ? Colors.yellowAccent
                                  : Colors.blueGrey,
                            );
                          }),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.vote,
                          style: const TextStyle(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Số Người Đi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Số người trong nhóm của bạn',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: ButtonDetail(
                              size: 50,
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor: selectedIndex == index
                                  ? Colors.black
                                  : Colors.deepPurple.withOpacity(0.1),
                              borderColor: selectedIndex == index
                                  ? Colors.black
                                  : Colors.deepPurple.withOpacity(0.1),
                              text: (index + 1).toString(),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Mô tả',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.8)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(widget.description)
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    ButtonDetail(
                      size: 60,
                      color: Colors.black,
                      backgroundColor: Colors.white,
                      borderColor: Colors.deepPurple,
                      isIcon: true,
                      icon: Icons.favorite_border,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartScreen(
                                  image: widget.image,
                                  title: widget.title,
                                  price: widget.price, location: widget.location,)),
                        );
                      },
                      child: ResponsiveButton(
                        isResponsive: true,
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
