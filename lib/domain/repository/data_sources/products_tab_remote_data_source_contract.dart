import 'package:dartz/dartz.dart';

import '../../entities/add_to_cart_response_entity.dart';
import '../../entities/add_to_wishlist_response_entity.dart';
import '../../entities/errors.dart';
import '../../entities/products_response_entity.dart';

abstract class ProductsTabRemoteDataSourceContract {
  Future<Either<Errors, ProductsResponseEntity>> getAllProducts();

  Future<Either<Errors, AddToCartResponseEntity>> addToCart(String? productId);
  Future<Either<Errors, AddToWishListResponseEntity>> addToWishList(
      String? productId);
}
