import 'dart:io';

import 'package:chandoiqua/data/services/firebase/provider/firebase_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/failure.dart';

final storageServiceProvider=Provider((ref)=>StorageService(firebaseStorage: ref.watch(firebaseStorageProvider)));
class StorageService{
  final FirebaseStorage _firebaseStorage;
  StorageService({required FirebaseStorage firebaseStorage}):_firebaseStorage=firebaseStorage;
  Future<Either<dynamic, dynamic>>storeFile({required String path,
    required String id,
    required File? file,
  }
      )async{
    try{
      final ref=_firebaseStorage.ref().child(path).child(id);
      UploadTask uploadTask;

      uploadTask=ref.putFile(file!);

      final snapShot=await uploadTask;
      return right(await snapShot.ref.getDownloadURL());
    }catch(e){
      return left(Failure(message: e.toString()));
    }


  }
}