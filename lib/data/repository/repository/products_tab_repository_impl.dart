import 'package:dartz/dartz.dart';

import '../../../domain/entities/add_to_cart_response_entity.dart';
import '../../../domain/entities/add_to_wishlist_response_entity.dart';
import '../../../domain/entities/errors.dart';
import '../../../domain/entities/products_response_entity.dart';
import '../../../domain/repository/data_sources/products_tab_remote_data_source_contract.dart';
import '../../../domain/repository/repository/products_tab_repository_contract.dart';

class ProductsTabRepositoryImpl implements ProductsTabRepositoryContract {
  ProductsTabRemoteDataSourceContract remoteDataSourceDelegate;

  ProductsTabRepositoryImpl({required this.remoteDataSourceDelegate});

  @override
  Future<Either<Errors, ProductsResponseEntity>> getAllProducts() {
    return remoteDataSourceDelegate.getAllProducts();
  }

  @override
  Future<Either<Errors, AddToCartResponseEntity>> addToCart(String? productId) {
    return remoteDataSourceDelegate.addToCart(productId);
  }

  @override
  Future<Either<Errors, AddToWishListResponseEntity>> addToWishList(
      String? productId) {
    return remoteDataSourceDelegate.addToWishList(productId);
  }
}
