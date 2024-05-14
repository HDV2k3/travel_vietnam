import 'dart:io';

import 'package:chandoiqua/data/repositories/abstract_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fpdart/fpdart.dart';

import '../../core/failure.dart';

class StorageRepository implements StorageInterface {
  final FirebaseStorage _firebaseStorage;
  StorageRepository({required FirebaseStorage firebaseStorage})
      : _firebaseStorage = firebaseStorage;
  @override
  Future<Either<dynamic, dynamic>> storeFile({
    required String path,
    required String id,
    required File? file,
  }) async {
    try {
      final ref = _firebaseStorage.ref().child(path).child(id);
      UploadTask uploadTask;
      uploadTask = ref.putFile(file!);
      final snapShot = await uploadTask;
      return right(await snapShot.ref.getDownloadURL());
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
