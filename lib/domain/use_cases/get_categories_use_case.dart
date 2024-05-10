import 'package:dartz/dartz.dart';

import '../entities/categories_response_entity.dart';
import '../entities/errors.dart';
import '../repository/repository/home_tab_repository_contract.dart';

class GetAllCategoriesUseCase {
  HomeTabRepositoryContract repositoryDelegate;

  GetAllCategoriesUseCase({required this.repositoryDelegate});

  Future<Either<Errors, CategoriesBrandsResponseEntity>> invoke() {
    return repositoryDelegate.getAllCategories();
  }
}
