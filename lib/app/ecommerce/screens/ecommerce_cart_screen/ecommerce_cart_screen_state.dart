part of 'ecommerce_cart_screen_cubit.dart';

@freezed
class EcommerceCartScreenState with _$EcommerceCartScreenState {
  const factory EcommerceCartScreenState.initial({
  List<ProductsDatabase>? cartItems,
    @Default(1) int productCount,
}) = _Initial;
}
