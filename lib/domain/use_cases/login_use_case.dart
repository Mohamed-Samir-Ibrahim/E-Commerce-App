import 'package:dartz/dartz.dart';

import '../entities/errors.dart';
import '../entities/register_response_entity.dart';
import '../repository/repository/auth_repository_contract.dart';

class LoginUseCase {
  AuthRepositoryContract authRepositoryDelegate;

  LoginUseCase({required this.authRepositoryDelegate});

  Future<Either<Errors, RegisterResponseEntitiy>> invoke(
      String? userEmail, String? uesrPassword) {
    return authRepositoryDelegate.login(userEmail, uesrPassword);
  }
}
