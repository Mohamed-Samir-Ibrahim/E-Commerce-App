import 'package:dartz/dartz.dart';

import '../entities/errors.dart';
import '../entities/products_response_entity.dart';
import '../repository/repository/products_tab_repository_contract.dart';

class GetAllProductsUseCase {
  ProductsTabRepositoryContract repositoryDelegate;

  GetAllProductsUseCase({required this.repositoryDelegate});

  Future<Either<Errors, ProductsResponseEntity>> invoke() {
    return repositoryDelegate.getAllProducts();
  }
}
