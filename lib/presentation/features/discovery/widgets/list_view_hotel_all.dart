import 'package:chandoiqua/data/services/firebase/models/hotels.dart';
import 'package:chandoiqua/utilities/extensions/string_extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/providers/app_language_provider.dart';
import 'button_heart.dart';

class ListViewAllHotel extends ConsumerWidget {
  const ListViewAllHotel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSupportedLanguage =
        ref.watch(appLanguageProvider).appSupportedLanguage;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('hotels').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final hotels = snapshot.data!.docs
              .map((doc) => Hotels.fromFirebase(doc))
              .toList();
          return Column(
            children: [
              Expanded(
                child: SizedBox(
                  height: double.maxFinite,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: hotels.length,
                    itemBuilder: (context, index) {
                      final hotel = hotels[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  hotel.images,
                                  fit: BoxFit.cover,
                                  height: 200,
                                  width: 180,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        hotel.tittle,
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
                                        child: FavoriteIconButton(
                                            key: Key(hotel.id)),
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
                ),
              ),
            ],
          );
        }
        return const CircularProgressIndicator(
          strokeWidth: 2,
        );
      },
    );
  }
}
