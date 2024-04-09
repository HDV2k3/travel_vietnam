// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class Carts {
//   String id;
//   String image;
//   String title;
//   String price;
//   String total_price;
//   String location;
//   Carts(
//       {required this.total_price,
//       required this.id,
//       required this.image,
//       required this.title,
//       required this.price,
//       required this.location});
//
//   Map<String, dynamic> toMap() {
//     return {
//       "id": id,
//       "image": image,
//       "title": title,
//       "price": price,
//       "location": location,
//       "total_price": total_price
//     };
//   }
//
//   factory Carts.fromFirebase(DocumentSnapshot snapshot) {
//     var data = snapshot.data() as Map<String, dynamic>;
//     return Carts(
//         id: data["id"],
//         image: data["image"],
//         title: data["title"],
//         price: data["price"],
//         location: data["location"],
//         total_price: data["total_price"]);
//   }
//
//   Carts copyWith(
//       {String? id,
//       String? image,
//       String? title,
//       String? total_price,
//       String? price,
//       String? location}) {
//     return Carts(
//         id: id ?? this.id,
//         image: image ?? this.image,
//         title: title ?? this.title,
//         price: price ?? this.price,
//         location: location ?? this.location,
//         total_price: total_price ?? this.total_price);
//   }
// }
