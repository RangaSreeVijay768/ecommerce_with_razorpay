import 'package:basic/app/ecommerce/products_database/products_database.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';

import 'package:get_it/get_it.dart';

part 'ecommerce_liked_products_screen_state.dart';

part 'ecommerce_liked_products_screen_cubit.freezed.dart';

class EcommerceLikedProductsScreenCubit
    extends BaseCubit<EcommerceLikedProductsScreenState> {
  EcommerceLikedProductsScreenCubit({required super.context})
      : super(initialState: EcommerceLikedProductsScreenState.initial(likedProducts: []));


  void removeLikedProduct(ProductsDatabase product) async{
    await ProductsDatabase.removeLikedProduct(product);
    emit(state.copyWith(likedProducts: ProductsDatabase.likedItems));
  }

}
