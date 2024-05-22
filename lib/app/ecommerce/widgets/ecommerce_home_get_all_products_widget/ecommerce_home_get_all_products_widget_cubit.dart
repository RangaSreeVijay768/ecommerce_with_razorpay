import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';

import 'package:get_it/get_it.dart';

import '../../../core/database/boolean_status.dart';
import '../../products_database/products_database.dart';

part 'ecommerce_home_get_all_products_widget_state.dart';

part 'ecommerce_home_get_all_products_widget_cubit.freezed.dart';

class EcommerceHomeGetAllProductsWidgetCubit
    extends BaseCubit<EcommerceHomeGetAllProductsWidgetState> {
  EcommerceHomeGetAllProductsWidgetCubit({required super.context})
      : super(
            initialState: EcommerceHomeGetAllProductsWidgetState.initial(
                likedProducts: [])){
    ProductsDatabase.loadLikedProducts();
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
