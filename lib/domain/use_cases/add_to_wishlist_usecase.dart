import 'package:dartz/dartz.dart';

import '../entities/add_to_wishlist_response_entity.dart';
import '../entities/errors.dart';
import '../repository/repository/products_tab_repository_contract.dart';

class AddToWishListUseCase {
  ProductsTabRepositoryContract repositoryDelegate;

  AddToWishListUseCase({required this.repositoryDelegate});

  Future<Either<Errors, AddToWishListResponseEntity>> invoke(
      String? productId) {
    return repositoryDelegate.addToWishList(productId);
  }
}
