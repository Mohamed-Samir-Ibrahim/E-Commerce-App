import 'package:dartz/dartz.dart';

import '../entities/errors.dart';
import '../entities/get_wishlist_response_entity.dart';
import '../repository/repository/wishlist_repository_contract.dart';

class GetWishListUseCase {
  WishListRepositoryContract repositoryDelegate;

  GetWishListUseCase({required this.repositoryDelegate});

  Future<Either<Errors, GetWishListResponseEntity>> invoke() {
    return repositoryDelegate.getWishList();
  }
}
