import 'package:ecommerce_app/ui/screens/home/home_tabs/products_tab/cubit/products_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../domain/entities/products_response_entity.dart';
import '../../../../../../domain/use_cases/add_to_cart_use_case.dart';
import '../../../../../../domain/use_cases/add_to_wishlist_usecase.dart';
import '../../../../../../domain/use_cases/get_products_use_case.dart';

class ProductsTabViewModel extends Cubit<ProductsTabStates> {
  GetAllProductsUseCase getAllProductsUseCase;
  AddToCartUseCase addToCartUseCase;
  AddToWishListUseCase addToWishListUseCase;

  ProductsTabViewModel(
      {required this.getAllProductsUseCase,
      required this.addToCartUseCase,
      required this.addToWishListUseCase})
      : super(ProductsTabInitialState());

  List<ProductEntity> products = [];
  num numOfProductsInCart = 0;

  static ProductsTabViewModel get(context) {
    return BlocProvider.of(context);
  }

  void getAllProducts() async {
    emit(ProductsTabLoadingState());
    var either = await getAllProductsUseCase.invoke();
    either.fold(
      (error) => emit(
        ProductsTabErrorState(error: error),
      ),
      (response) {
        products = response.data ?? [];
        emit(
          ProductsTabSuccesslState(productsResponse: response),
        );
      },
    );
  }

  void addToCart(String productId) async {
    emit(AddToCartLoadingState());
    var either = await addToCartUseCase.invoke(productId);
    either.fold(
      (error) => emit(
        AddToCartErrorState(
          error: error,
        ),
      ),
      (response) {
        numOfProductsInCart = response.numOfCartItems ?? 0;
        emit(AddToCartSuccesslState(addToCartResponseEntity: response));
      },
    );
  }

  void addToWishList(String productId) async {
    emit(AddToWishListLoadingState());
    var either = await addToWishListUseCase.invoke(productId);
    either.fold(
        (error) => emit(
              AddToWishListErrorState(error: error),
            ), (response) {
      emit(AddToWishListSuccesslState(addToWishListResponseEntity: response));
    });
  }
}
