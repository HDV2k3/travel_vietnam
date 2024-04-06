import 'package:chandoiqua/utilities/extensions/string_extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/providers/app_language_provider.dart';
import '../../../../data/services/firebase/models/locations.dart';

class HorizontalListView extends ConsumerWidget {
  const HorizontalListView({super.key});

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
          return Stack(
            // height: MediaQuery.of(context).size.height / 3,
            children: [
              SizedBox(
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
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                location.image,
                                fit: BoxFit.cover,
                                height: 250,
                                width: 180,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  location.title,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
