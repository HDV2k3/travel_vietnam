import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseConstants
{
  static const usersCollection = "users";
  static final user = FirebaseAuth.instance.currentUser!;
  static final currentUser = FirebaseAuth.instance.currentUser;
  static final addressRef =
  FirebaseFirestore.instance.collection("Adresses").doc(user.uid);

  static const locationsCollection = "location";

  static const hotelsCollection = "hotels";

  static const cartCollection = "cart";
  static final cartRef = FirebaseFirestore.instance
      .collection("users")
      .doc(user.uid.toString());
  static final orderRef = FirebaseFirestore.instance
      .collection("users")
      .doc(user.uid.toString());

  static const orderCollection="orders";

  static const paymentsCollection="payments";

  static final favoriteRef =
  FirebaseFirestore.instance.collection("favorite").doc(user.uid.toString());

}