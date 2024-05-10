import 'package:ecommerce_app/ui/screens/home/home_tabs/wishlist_tab/cubit/wishlist_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../domain/entities/get_wishlist_response_entity.dart';
import '../../../../../../domain/use_cases/get_wishlist_usecase.dart';
import '../../../../../../domain/use_cases/remove_from_wishlist_usecase.dart';

class WishListTabViewModel extends Cubit<WishListTabStates> {
  GetWishListUseCase getWishListUseCase;
  RemoveFromWishListUseCase removeFromWishListUseCase;
  WishListTabViewModel(
      {required this.getWishListUseCase,
      required this.removeFromWishListUseCase})
      : super(WishListInitialState());

  List<WishListProductEntity> wishListProducts = [];

  void getWishList() async {
    emit(WishListLoadingState());
    var either = await getWishListUseCase.invoke();
    either.fold(
        (error) => emit(
              WishListErrorState(error: error),
            ), (response) {
      wishListProducts = response.data ?? [];
      emit(WishListSuccessState(wishListResponseEntity: response));
    });
  }

  void removeFromWishList(String productId) async {
    emit(RemoveFromWishListLoadingState());
    var either = await removeFromWishListUseCase.invoke(productId);
    either.fold(
        (error) => emit(
              RemoveFromWishListErrorState(error: error),
            ), (response) {
      emit(RemoveFromWishListSuccessState(
          removeFromWishListResponseEntity: response));
    });
  }

  void relodaWishList() async {
    var either = await getWishListUseCase.invoke();

    either.fold(
        (error) => emit(
              WishListErrorState(error: error),
            ), (response) {
      wishListProducts = response.data ?? [];
      emit(WishListSuccessState(wishListResponseEntity: response));
    });
  }
}
