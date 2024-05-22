import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get_it/get_it.dart';

import '../../products_database/products_database.dart';

part 'ecommerce_cart_screen_state.dart';

part 'ecommerce_cart_screen_cubit.freezed.dart';

class EcommerceCartScreenCubit extends BaseCubit<EcommerceCartScreenState> {
  EcommerceCartScreenCubit({required super.context})
      : super(initialState: EcommerceCartScreenState.initial(productCount: 1));

  void removeFromCart(ProductsDatabase product) async {
    await ProductsDatabase.removeFromCart(product);
    emit(state.copyWith(cartItems: ProductsDatabase.cartItems));
  }

  void increaseCount() {
    emit(state.copyWith(productCount: state.productCount + 1));
  }
  void decreaseCount() {
    if(state.productCount > 1){
      emit(state.copyWith(productCount: state.productCount - 1));
    }
  }

  void clearCart() async{
    await ProductsDatabase.clearCart();
    emit(state.copyWith(cartItems: ProductsDatabase.cartItems));
  }

  void openRazorpayPaymentLink(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }


}
