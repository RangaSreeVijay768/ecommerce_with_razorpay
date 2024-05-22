import 'dart:collection';

import 'package:basic/app/ecommerce/products_database/products_database.dart';
import 'package:basic/app/ecommerce/widgets/ecommerce_home_get_all_products_widget/ecommerce_home_get_all_products_widget_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';

import 'package:get_it/get_it.dart';

part 'ecommerce_product_details_screen_state.dart';

part 'ecommerce_product_details_screen_cubit.freezed.dart';

class EcommerceProductDetailsScreenCubit
    extends BaseCubit<EcommerceProductDetailsScreenState> {
  EcommerceProductDetailsScreenCubit({required super.context})
      : super(initialState: EcommerceProductDetailsScreenState.initial(productCount: 1, cartItems: [], selectedSize: 2, likedProducts: []));

  void increaseCount() {
    emit(state.copyWith(productCount: state.productCount + 1));
  }
  void decreaseCount() {
    if(state.productCount > 1){
      emit(state.copyWith(productCount: state.productCount - 1));
    }
  }
  void selectSize(int value){
    emit(state.copyWith(selectedSize: value));
  }

  void addToCart(ProductsDatabase product) async {
    if (!state.cartItems.contains(product)) {
      await ProductsDatabase.addToCart(product);
      emit(state.copyWith(cartItems: ProductsDatabase.cartItems));
      showSuccessMessage('Product added to cart successfully');
    }
  }

  void likeProduct(int productId) {
    ProductsDatabase.likedItems.add(ProductsDatabase.availableProducts
        .firstWhere((product) => product.id == productId));
    emit(state.copyWith(likedProducts: List.from(ProductsDatabase.likedItems)));
    ProductsDatabase.saveLikedProducts();
  }

  void removeLikedProduct(int productId) {
    ProductsDatabase.likedItems.removeWhere((item) => item.id == productId);
    emit(state.copyWith(likedProducts: List.from(ProductsDatabase.likedItems)));
    ProductsDatabase.saveLikedProducts();
  }

}
