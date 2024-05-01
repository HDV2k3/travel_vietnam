import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SliderImageActivity extends ConsumerWidget {
  const SliderImageActivity({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<String>>(
      future:
          getImageUrlsFromFirebase(), // Call the function to get the image URLs from Firebase
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child:
                CircularProgressIndicator(), // Show a loading indicator while fetching data
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
                'Error: ${snapshot.error}'), // Show an error message if there's an error
          );
        } else if (snapshot.hasData && snapshot.data != null) {
          List<String> imageUrls =
              snapshot.data!; // Get the image URLs from the snapshot

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
                        image: NetworkImage(
                            imageUrl), // Use NetworkImage to load the image from the URL
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
            child:
                Text('No data available'), // Show a message if there's no data
          );
        }
      },
    );
  }

// Function to get the image URLs from the 'location' collection in Firestore
  Future<List<String>> getImageUrlsFromFirebase() async {
    List<String> imageUrls = [];
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('location')
        .get(); // Get the documents from the 'location' collection
    for (var doc in snapshot.docs) {
      // Convert the 'imageUrl' array to a list of strings
      List<dynamic> imageUrlArray =
          doc['imageActivity'] as List<dynamic>; // Cast to List<dynamic>
      List<String> imageUrlList =
          imageUrlArray.map((imageUrl) => imageUrl as String).toList();
      imageUrls.addAll(imageUrlList);
    }
    if (kDebugMode) {
      print(imageUrls);
    }
    return imageUrls;
  }
}
