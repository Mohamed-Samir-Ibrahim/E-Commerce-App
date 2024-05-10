import 'package:dartz/dartz.dart';

import '../entities/errors.dart';
import '../entities/register_response_entity.dart';
import '../repository/repository/auth_repository_contract.dart';

class RegisterUseCase {
  AuthRepositoryContract authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Errors, RegisterResponseEntitiy>> invoke(String? userName,
      String? userPhoneNumber, String? userEmail, String? userPassword) {
    return authRepository.register(
        userName, userPhoneNumber, userEmail, userPassword);
  }
}
