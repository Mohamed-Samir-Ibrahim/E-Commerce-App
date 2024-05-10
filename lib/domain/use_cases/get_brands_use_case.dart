import 'package:dartz/dartz.dart';

import '../entities/categories_response_entity.dart';
import '../entities/errors.dart';
import '../repository/repository/home_tab_repository_contract.dart';

class GetAllBrandsUseCase {
  HomeTabRepositoryContract repositoryDelegate;

  GetAllBrandsUseCase({required this.repositoryDelegate});

  Future<Either<Errors, CategoriesBrandsResponseEntity>> invoke() {
    return repositoryDelegate.getAllBrands();
  }
}
