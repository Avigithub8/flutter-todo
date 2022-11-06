import 'package:dartz/dartz.dart';

// ignore: camel_case_types
typedef firebaseResponse<T> = Either<Failure, T>;

class Failure {
  final int code;
  final Object response;

  Failure({
    required this.code,
    required this.response,
  });
}
