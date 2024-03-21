import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String id;
  String name;
  String birthday;
  String avatar;
  bool gender;
  String email;
  String password;
  Users({
    required this.id,
    required this.name,
    required this.birthday,
    required this.avatar,
    this.gender = true,
    required this.email,
    required this.password,
  });
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "birthday": birthday,
      "avatar": avatar,
      "gender": gender,
      "email": email,
      "password": password,
    };
  }

  factory Users.fromFirebase(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return Users(
      id: data["id"],
      name: data["name"],
      birthday: data["birthday"],
      avatar: data["avatar"],
      gender: data['gender'] as bool,
      email: data['email'],
      password: data['password'],
    );
  }

  Users copyWith({
    String? id,
    String? name,
    String? birthday,
    String? avatar,
    bool? gender,
    String? email,
    String? password,
  }) {
    return Users(
      id: id ?? this.id,
      name: name ?? this.name,
      birthday: birthday ?? this.birthday,
      avatar: avatar ?? this.avatar,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
