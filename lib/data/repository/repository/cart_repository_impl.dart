import 'package:dartz/dartz.dart';

import '../../../domain/entities/errors.dart';
import '../../../domain/entities/get_cart_response_entity.dart';
import '../../../domain/repository/data_sources/cart_remote_data_source_contract.dart';
import '../../../domain/repository/repository/cart_repository_contract.dart';

class CartRepositoryImpl implements CartRepositoryContract {
  CartRemoteDataSourceContract remoteDataSourceDelegate;

  CartRepositoryImpl({required this.remoteDataSourceDelegate});

  @override
  Future<Either<Errors, GetCartResponseEntity>> getCartProducts() {
    return remoteDataSourceDelegate.getCartProducts();
  }

  @override
  Future<Either<Errors, GetCartResponseEntity>> deleteProductFromCart(
      String productId) {
    return remoteDataSourceDelegate.deleteProductFromCart(productId);
  }

  @override
  Future<Either<Errors, GetCartResponseEntity>> updateProductCountInCart(
      String productId, int count) {
    return remoteDataSourceDelegate.updateProductCountInCart(productId, count);
  }
}
