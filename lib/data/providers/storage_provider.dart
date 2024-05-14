import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/storage_repository.dart';
import 'firebase_provider.dart';

final storageServiceProvider = Provider((ref) =>
    StorageRepository(firebaseStorage: ref.watch(firebaseStorageProvider)));
