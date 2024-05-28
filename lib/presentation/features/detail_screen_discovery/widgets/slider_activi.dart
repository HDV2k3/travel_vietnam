import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentIndexProvider = Provider<int>((ref) => 0);

class SliderImageActivity extends ConsumerWidget {
  const SliderImageActivity({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<Map<String, List<String>>>(
      future: getImageUrlsFromFirebase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData && snapshot.data != null) {
          Map<String, List<String>> roomImageUrls = snapshot.data!;
          List<String> allImageUrls =
              roomImageUrls.values.expand((urls) => urls).toList();

          return CarouselSlider(
            options: CarouselOptions(
              height: 200,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {},
            ),
            items: allImageUrls.map((imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        } else {
          return const Center(
            child: Text('No data available'),
          );
        }
      },
    );
  }

  Future<Map<String, List<String>>> getImageUrlsFromFirebase() async {
    Map<String, List<String>> roomImageUrls = {};

    QuerySnapshot locationsSnapshot =
        await FirebaseFirestore.instance.collection('location').get();

    for (var locationDoc in locationsSnapshot.docs) {
      String locationId = locationDoc.id;
      List<dynamic> imageUrlArray =
          locationDoc['imageActivity'] as List<dynamic>;
      List<String> imageUrlList =
          imageUrlArray.map((imageUrl) => imageUrl as String).toList();

      roomImageUrls[locationId] = imageUrlList;
    }

    if (kDebugMode) {
      print(roomImageUrls);
    }

    return roomImageUrls;
  }
}
