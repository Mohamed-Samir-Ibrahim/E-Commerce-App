import 'package:dartz/dartz.dart';

import '../../entities/add_to_wishlist_response_entity.dart';
import '../../entities/errors.dart';
import '../../entities/get_wishlist_response_entity.dart';

abstract class WishListRemoteDataSourceContract {
  Future<Either<Errors, GetWishListResponseEntity>> getWishList();
  Future<Either<Errors, AddToWishListResponseEntity>> removeFromWishList(
      String productId);
}
