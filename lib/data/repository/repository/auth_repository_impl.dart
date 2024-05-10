import 'package:dartz/dartz.dart';

import '../../../domain/entities/errors.dart';
import '../../../domain/entities/register_response_entity.dart';
import '../../../domain/repository/data_sources/auth_remote_data_source_contract.dart';
import '../../../domain/repository/repository/auth_repository_contract.dart';

class AuthRepositoryImpl implements AuthRepositoryContract {
  AuthRemoteDataSourceContract remoteDataSourceDelegate;

  AuthRepositoryImpl({required this.remoteDataSourceDelegate});

  @override
  Future<Either<Errors, RegisterResponseEntitiy>> register(String? userName,
      String? userPhoneNumber, String? userEmail, String? uesrPassword) {
    return remoteDataSourceDelegate.register(
        userName, userPhoneNumber, userEmail, uesrPassword);
  }

  @override
  Future<Either<Errors, RegisterResponseEntitiy>> login(
      String? userEmail, String? uesrPassword) {
    return remoteDataSourceDelegate.login(userEmail, uesrPassword);
  }
}
