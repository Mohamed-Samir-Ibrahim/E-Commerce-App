import 'package:dartz/dartz.dart';

import '../entities/add_to_cart_response_entity.dart';
import '../entities/errors.dart';
import '../repository/repository/products_tab_repository_contract.dart';

class AddToCartUseCase {
  ProductsTabRepositoryContract repositoryDelegate;

  AddToCartUseCase({required this.repositoryDelegate});

  Future<Either<Errors, AddToCartResponseEntity>> invoke(String? productId) {
    return repositoryDelegate.addToCart(productId);
  }
}
