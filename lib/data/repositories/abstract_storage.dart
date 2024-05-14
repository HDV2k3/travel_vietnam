import 'dart:io';

import 'package:fpdart/fpdart.dart';

abstract class StorageInterface {
  Future<Either<dynamic, dynamic>> storeFile({
    required String path,
    required String id,
    required File? file,
  });
}
