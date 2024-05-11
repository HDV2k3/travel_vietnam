import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SliderImage extends ConsumerWidget {
  const SliderImage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> imageUrls = [
      'assets/images/dn2.jpg',
      'assets/images/dn1.jpeg',
      'assets/images/dn2.jpg',
      'assets/images/dn3.jpg',
    ];
    return CarouselSlider(
      options: CarouselOptions(
        height: 200, // Set the height of the slider
        enableInfiniteScroll: true, // Enable infinite scrolling
        autoPlay: true, // Enable auto play
        autoPlayInterval:
            const Duration(seconds: 3), // Set the auto play interval
        enlargeCenterPage: true, // Enlarge the center page
        viewportFraction:
            1, // Set the visible portion of each item on the screen
        onPageChanged: (index, reason) {
          // Callback function for when the page changes
        },
      ),
      items: imageUrls.map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.fitWidth,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
