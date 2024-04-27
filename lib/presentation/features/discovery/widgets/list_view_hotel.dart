import 'package:chandoiqua/data/services/firebase/models/hotels.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../../data/providers/favorite_provider.dart';
import '../../detail_screen_hotel/detail_screen_hotel.dart';

class ListViewHotel extends ConsumerWidget {
  const ListViewHotel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final isFavorite = ref.watch(favoriteProvider);
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('hotels').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final hotels = snapshot.data!.docs
              .map((doc) => Hotels.fromFirebase(doc))
              .toList();
          return
           Column(
             children: [
               Expanded(child:
               SizedBox(
                 height: double.maxFinite,
                 child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   itemCount: hotels.length,
                   itemBuilder: (context, index) {
                     final location = hotels[index];
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
                                     builder: (context) => DetailPageHotel(
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
                                     // FavoriteIcon(isFavorite: isFavorite, onPressed: () {  },
                                     //
                                     // ),
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
          strokeWidth: 0.5,
        );
      },
    );
  }
}
