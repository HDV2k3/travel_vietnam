import 'package:cloud_firestore/cloud_firestore.dart';

class Hotels {
  String id;
  String images;
  String tittle;

  Hotels({
    required this.id,
    required this.images,
    required this.tittle,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "images": images,
      "tittle": tittle,
    };
  }

  factory Hotels.fromFirebase(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return Hotels(
      id: data["id"].toString(),
      images: data["images"] ?? "", // Set a default value if the field is null
      tittle: data["tittle"] ?? "", // Set a default value if the field is null
    );
  }

  Hotels copyWith({
    String? id,
    String? images,
    String? tittle,
  }) {
    return Hotels(
      id: id ?? this.id,
      images: images ?? this.images,
      tittle: tittle ?? this.tittle,
    );
  }
}
