import 'package:dartz/dartz.dart';

import '../../entities/errors.dart';
import '../../entities/register_response_entity.dart';

abstract class AuthRemoteDataSourceContract {
  Future<Either<Errors, RegisterResponseEntitiy>> register(
    String? userName,
    String? userPhoneNumber,
    String? userEmail,
    String? uesrPassword,
  );
  Future<Either<Errors, RegisterResponseEntitiy>> login(
      String? userEmail, String? uesrPassword);
}
