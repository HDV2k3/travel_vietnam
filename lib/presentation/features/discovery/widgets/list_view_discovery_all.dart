import 'package:chandoiqua/presentation/features/detail_screen_discovery/detail_screen_discovery.dart';
import 'package:chandoiqua/utilities/extensions/string_extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/providers/app_language_provider.dart';
import '../../../../data/services/firebase/models/locations.dart';
import 'button_heart.dart';

class ListViewAll extends ConsumerWidget {
  const ListViewAll({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSupportedLanguage =
        ref.watch(appLanguageProvider).appSupportedLanguage;

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('locations').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final locations = snapshot.data!.docs
              .map((doc) => Locations.fromFirebase(doc))
              .toList();
          return SizedBox(
            height: double.maxFinite,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: locations.length,
              itemBuilder: (context, index) {
                final location = locations[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
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
                                  width: 20,
                                ),
                                ProviderScope(
                                  child:
                                      FavoriteIconButton(key: Key(location.id)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const CircularProgressIndicator(
          strokeWidth: 0.5,
        );
      },
    );
  }
}
