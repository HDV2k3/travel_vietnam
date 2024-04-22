import 'package:chandoiqua/data/providers/favorite_provider.dart';
import 'package:chandoiqua/presentation/features/detail_screen_discovery/detail_screen_discovery.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../data/services/firebase/models/locations.dart';
import '../../../controllers/discovery_controller.dart';
import 'favorite_icon.dart';
class ListViewAll extends ConsumerWidget {
  const ListViewAll({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final isFavorite = ref.watch(favoriteProvider);
    final DiscoveryController discoveryController =
    Get.put(DiscoveryController());
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('locations').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final locations = snapshot.data!.docs
              .map((doc) => Locations.fromFirebase(doc))
              .toList();
          return Column(
            children: [
              Expanded(
                child: SizedBox(
                  height: double.maxFinite,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: locations.length,
                    itemBuilder: (context, index) {
                      final location = locations[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailPage(
                                            image: location.image,
                                            title: location.title,
                                            description: location.description,
                                            price: location.price,
                                            location: location.location,
                                            vote: location.vote,
                                            nation: location.nation,
                                          ),
                                        ),
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        location.image,
                                        fit: BoxFit.cover,
                                        height: 200,
                                        width: 180,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            location.title,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 50,
                                          ),
                                          FavoriteIcon(isFavorite: isFavorite,
                                            onPressed: () {
                                              discoveryController.addToFavorite(
                                                title: location.title,
                                                image: location.image,
                                                price: location.price,
                                                location: location.location,
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        }
        return const CircularProgressIndicator(
          strokeWidth: 0.5,
        );
      },
    );
  }


}
