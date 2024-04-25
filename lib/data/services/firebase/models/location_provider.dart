import 'package:chandoiqua/data/services/firebase/models/locations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final locationProvider = FutureProvider<List<Locations>>((ref) async {
  final collection = FirebaseFirestore.instance.collection('locations');
  final snapshot = await collection.get();
  final locations = snapshot.docs.map((doc) => Locations.fromFirebase(doc)).toList();
  return locations;
});