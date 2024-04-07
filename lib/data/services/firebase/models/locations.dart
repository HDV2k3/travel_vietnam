import 'package:cloud_firestore/cloud_firestore.dart';

class Locations {
  String id;
  String image;
  String title;
  String price;
  String description;
  Locations({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "image": image,
      "title": title,
      "price": price,
      "description": description,
    };
  }

  factory Locations.fromFirebase(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return Locations(
      id: data["id"],
      image: data["image"],
      title: data["title"],
      price: data["price"],
      description: data["description"],
    );
  }

  Locations copyWith({
    String? id,
    String? image,
    String? vote,
    String? title,
    String? description,
    String? price,
  }) {
    return Locations(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
    );
  }
}
