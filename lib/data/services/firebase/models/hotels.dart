import 'package:cloud_firestore/cloud_firestore.dart';

class Hotels {
  String id;
  String image;
  String title;

  Hotels({
    required this.id,
    required this.image,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "image": image,
      "title": title,
    };
  }

  factory Hotels.fromFirebase(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return Hotels(
      id: data["id"].toString(),
      image: data["image"] ?? "", // Set a default value if the field is null
      title: data["title"] ?? "", // Set a default value if the field is null
    );
  }

  Hotels copyWith({
    String? id,
    String? images,
    String? tittle,
  }) {
    return Hotels(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
    );
  }
}
