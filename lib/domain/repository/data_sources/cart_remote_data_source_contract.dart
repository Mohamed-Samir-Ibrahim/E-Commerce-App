import 'package:dartz/dartz.dart';

import '../../entities/errors.dart';
import '../../entities/get_cart_response_entity.dart';

abstract class CartRemoteDataSourceContract {
  Future<Either<Errors, GetCartResponseEntity>> getCartProducts();
  Future<Either<Errors, GetCartResponseEntity>> deleteProductFromCart(
      String productId);
  Future<Either<Errors, GetCartResponseEntity>> updateProductCountInCart(
      String productId, int count);
}
