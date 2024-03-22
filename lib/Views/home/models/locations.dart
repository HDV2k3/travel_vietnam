import 'package:cloud_firestore/cloud_firestore.dart';

class Locations {
  String id;
  String image;
  String vote;
  String title;
  String description;
  String price;

  Locations({
    required this.id,
    required this.image,
    required this.vote,
    required this.title,
    required this.description,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "image": image,
      "vote": vote,
      "title": title,
      "description": description,
      "price": price,
    };
  }

  factory Locations.fromFirebase(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return Locations(
        id: data["id"],
        image: data["image"],
        vote: data["vote"],
        title: data["title"],
        description: data["description"],
        price: data["price"]);
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
      vote: vote ?? this.vote,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
    );
  }
}
