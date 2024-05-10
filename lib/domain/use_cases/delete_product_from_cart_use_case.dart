import 'package:dartz/dartz.dart';

import '../entities/errors.dart';
import '../entities/get_cart_response_entity.dart';
import '../repository/repository/cart_repository_contract.dart';

class DeleteProductFromCartUseCase {
  CartRepositoryContract repositoryDelegate;

  DeleteProductFromCartUseCase({required this.repositoryDelegate});

  Future<Either<Errors, GetCartResponseEntity>> invoke(String productId) async {
    return repositoryDelegate.deleteProductFromCart(productId);
  }
}
