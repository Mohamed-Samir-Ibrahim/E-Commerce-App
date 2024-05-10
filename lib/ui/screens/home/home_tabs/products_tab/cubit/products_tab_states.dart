

import '../../../../../../domain/entities/add_to_cart_response_entity.dart';
import '../../../../../../domain/entities/add_to_wishlist_response_entity.dart';
import '../../../../../../domain/entities/errors.dart';
import '../../../../../../domain/entities/products_response_entity.dart';

abstract class ProductsTabStates {}

///* ------------- ProductTabStates -------------------

class ProductsTabInitialState extends ProductsTabStates {}

class ProductsTabLoadingState extends ProductsTabStates {}

class ProductsTabErrorState extends ProductsTabStates {
  Errors? error;

  ProductsTabErrorState({required this.error});
}

class ProductsTabSuccesslState extends ProductsTabStates {
  ProductsResponseEntity? productsResponse;

  ProductsTabSuccesslState({required this.productsResponse});
}

///* ------------- AddToCartStates -------------------

class AddToCartLoadingState extends ProductsTabStates {
  String? loadingMessage;

  AddToCartLoadingState({this.loadingMessage});
}

class AddToCartErrorState extends ProductsTabStates {
  Errors? error;

  AddToCartErrorState({required this.error});
}

class AddToCartSuccesslState extends ProductsTabStates {
  AddToCartResponseEntity? addToCartResponseEntity;

  AddToCartSuccesslState({required this.addToCartResponseEntity});
}

///* ------------- AddToWishListStates -------------------
class AddToWishListLoadingState extends ProductsTabStates {}

class AddToWishListErrorState extends ProductsTabStates {
  Errors? error;

  AddToWishListErrorState({required this.error});
}

class AddToWishListSuccesslState extends ProductsTabStates {
  AddToWishListResponseEntity? addToWishListResponseEntity;

  AddToWishListSuccesslState({required this.addToWishListResponseEntity});
}
