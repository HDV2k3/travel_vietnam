import 'package:cloud_firestore/cloud_firestore.dart';

class Locations {
  String id;
  String image;
  String vote;
  String title;

  Locations({
    required this.id,
    required this.image,
    required this.vote,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "image": image,
      "vote": vote,
      "title": title,
    };
  }

  factory Locations.fromFirebase(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return Locations(
        id: data["id"],
        image: data["image"],
        vote: data["vote"],
        title: data["title"]);
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
    );
  }
}
