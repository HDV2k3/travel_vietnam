import 'package:cloud_firestore/cloud_firestore.dart';

class Hotel {
  final String id;
  final String image;
  final String title;

  Hotel({required this.id, required this.image, required this.title});

  factory Hotel.fromFirebase(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final id = data['id'] as String;
    final image = data['image'] as String;
    final title = data['title'] as String;
    return Hotel(id: id, image: image, title: title);
  }
}
