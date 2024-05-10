import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/get_cart_response_entity.dart';
import '../../../../domain/use_cases/delete_product_from_cart_use_case.dart';
import '../../../../domain/use_cases/get_cart_products_use_case.dart';
import '../../../../domain/use_cases/update_product_count_in_cart_use_case.dart';
import 'cart_screen_states.dart';

class CartScreenViewModel extends Cubit<CartScreenStates> {
  GetCartProductsUseCase getCartProductsUseCase;
  DeleteProductFromCartUseCase deleteProductFromCartUseCase;
  UpdateProductCountInCartUseCase updateProductCountInCartUseCase;

  CartScreenViewModel({
    required this.getCartProductsUseCase,
    required this.deleteProductFromCartUseCase,
    required this.updateProductCountInCartUseCase,
  }) : super(CartScreenInitialState());

  List<CartProductsEntity> cartProducts = [];

  static CartScreenViewModel get(context) => BlocProvider.of(context);

  void getCartProducts() async {
    emit(GetCartLoadingState());
    var either = await getCartProductsUseCase.invoke();
    either.fold(
      (error) => emit(
        GetCartErrorState(error: error),
      ),
      (response) {
        cartProducts = response.data?.products ?? [];
        emit(GetCartSuccessState(getCartResponseEntity: response));
      },
    );
  }

  void deleteProductFromCart(String productId) async {
    var either = await deleteProductFromCartUseCase.invoke(productId);
    either.fold(
      (error) => emit(DeleteFromCartErrorState(error: error)),
      (response) {
        //* No need to update the list when delete in case of using the `response` not the `list`
        cartProducts = response.data?.products ?? [];
        emit(GetCartSuccessState(getCartResponseEntity: response));
      },
    );
  }

  void updateProductCountInCart(String productId, int count) async {
    var either = await updateProductCountInCartUseCase.invoke(productId, count);
    either.fold(
      (error) => emit(UpdateCartProductCountErrorState(error: error)),
      (response) {
        //* No need to update the list when delete in case of using the `response` not the `list`
        cartProducts = response.data?.products ?? [];
        emit(GetCartSuccessState(getCartResponseEntity: response));
      },
    );
  }
}
