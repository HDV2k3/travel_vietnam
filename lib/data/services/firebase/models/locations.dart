import 'package:cloud_firestore/cloud_firestore.dart';

class Locations {
  String id;
  String image;
  String title;
  String price;
  String description;
  String location;
  String vote;
  Locations({
    required this.vote,
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.location
  });

  Map<String, dynamic> toMap() {
    return {
      "vote":vote,
      "id": id,
      "image": image,
      "title": title,
      "price": price,
      "description": description,
      "location":location
    };
  }

  factory Locations.fromFirebase(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return Locations(
      vote: data["vote"],
      id: data["id"],
      image: data["image"],
      title: data["title"],
      price: data["price"],
      description: data["description"],
      location: data["location"]
    );
  }

  Locations copyWith({
    String? id,
    String? image,
    String? vote,
    String? title,
    String? description,
    String? price,
    String? location
  }) {
    return Locations(
      vote: vote?? this.vote,
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      location: location?? this.location
    );
  }
}
