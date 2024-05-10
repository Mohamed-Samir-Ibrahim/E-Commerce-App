

import '../../../../../../domain/entities/add_to_wishlist_response_entity.dart';
import '../../../../../../domain/entities/errors.dart';
import '../../../../../../domain/entities/get_wishlist_response_entity.dart';

abstract class WishListTabStates {}

class WishListInitialState extends WishListTabStates {}

///* ----------- GetWishListStates ----------------
class WishListLoadingState extends WishListTabStates {}

class WishListErrorState extends WishListTabStates {
  Errors error;
  WishListErrorState({required this.error});
}

class WishListSuccessState extends WishListTabStates {
  GetWishListResponseEntity wishListResponseEntity;
  WishListSuccessState({required this.wishListResponseEntity});
}

///* ----------- RemoveFromWishListStates ----------------
class RemoveFromWishListLoadingState extends WishListTabStates {}

class RemoveFromWishListErrorState extends WishListTabStates {
  Errors error;
  RemoveFromWishListErrorState({required this.error});
}

class RemoveFromWishListSuccessState extends WishListTabStates {
  AddToWishListResponseEntity removeFromWishListResponseEntity;

  RemoveFromWishListSuccessState({
    required this.removeFromWishListResponseEntity,
  });
}
