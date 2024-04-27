
import 'package:cloud_firestore/cloud_firestore.dart';

class Locations {
  String id;
  String image;
  String title;
  String price;
  String description;
  String location;
  String vote;
  String nation;
  Locations(
      {required this.nation,
      required this.vote,
      required this.id,
      required this.image,
      required this.title,
      required this.price,
      required this.description,
      required this.location});

  Map<String, dynamic> toMap() {
    return {
      "nation": nation,
      "vote": vote,
      "id": id,
      "image": image,
      "title": title,
      "price": price,
      "description": description,
      "location": location
    };
  }

  factory Locations.fromFirebase(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return Locations(
        nation: data["nation"],
        vote: data["vote"],
        id: data["id"],
        image: data["image"],
        title: data["title"],
        price: data["price"],
        description: data["description"],
        location: data["location"]);
  }

  Locations copyWith(
      {String? nation,
      String? id,
      String? image,
      String? vote,
      String? title,
      String? description,
        String? price,
      String? location}) {
    return Locations(
        nation: nation ?? this.nation,
        vote: vote ?? this.vote,
        id: id ?? this.id,
        image: image ?? this.image,
        title: title ?? this.title,
        description: description ?? this.description,
        price: price ?? this.price,
        location: location ?? this.location);
  }
}
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class Locations {
//   String id;
//   List<String> images; // Thay đổi từ String thành List<String>
//   String title;
//   String price;
//   String description;
//   String location;
//   String vote;
//   String nation;
//
//   Locations({
//     required this.nation,
//     required this.vote,
//     required this.id,
//     required this.images, // Thay đổi từ String thành List<String>
//     required this.title,
//     required this.price,
//     required this.description,
//     required this.location,
//   });
//
//   Map<String, dynamic> toMap() {
//     return {
//       "nation": nation,
//       "vote": vote,
//       "id": id,
//       "images": images, // Thay đổi từ image thành images
//       "title": title,
//       "price": price,
//       "description": description,
//       "location": location,
//     };
//   }
//
//   factory Locations.fromFirebase(DocumentSnapshot snapshot) {
//     var data = snapshot.data() as Map<String, dynamic>;
//     return Locations(
//       nation: data["nation"],
//       vote: data["vote"],
//       id: data["id"],
//       images: List<String>.from(data["images"]), // Thay đổi từ String thành List<String>
//       title: data["title"],
//       price: data["price"],
//       description: data["description"],
//       location: data["location"],
//     );
//   }
//
//   Locations copyWith({
//     String? nation,
//     String? id,
//     List<String>? images, // Thay đổi từ String thành List<String>
//     String? vote,
//     String? title,
//     String? description,
//     String? price,
//     String? location,
//   }) {
//     return Locations(
//       nation: nation ?? this.nation,
//       vote: vote ?? this.vote,
//       id: id ?? this.id,
//       images: images ?? this.images, // Thay đổi từ image thành images
//       title: title ?? this.title,
//       description: description ?? this.description,
//       price: price ?? this.price,
//       location: location ?? this.location,
//     );
//   }
// }