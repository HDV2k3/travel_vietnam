import 'package:either_dart/either.dart';
import 'failure.dart';

typedef FutureEither<T>=Future<Either<Failure,T>>;
typedef FutureVoid=FutureEither<void>;