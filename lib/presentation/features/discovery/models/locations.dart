import 'package:cloud_firestore/cloud_firestore.dart';

class Location {
  final String id;
  final String image;
  final String title;

  Location({required this.id, required this.image, required this.title});

  factory Location.fromFirebase(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final id = data['id'] as String;
    final image = data['image'] as String;
    final title = data['title'] as String;
    return Location(id: id, image: image, title: title);
  }
}
