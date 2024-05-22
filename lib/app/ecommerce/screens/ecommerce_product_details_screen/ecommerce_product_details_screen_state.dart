part of 'ecommerce_product_details_screen_cubit.dart';

@freezed
class EcommerceProductDetailsScreenState
    with _$EcommerceProductDetailsScreenState {
  const factory EcommerceProductDetailsScreenState.initial({
    @Default(1) int productCount,
    required List<ProductsDatabase> cartItems,
    required List<ProductsDatabase> likedProducts,
    int? selectedSize
}) = _Initial;
}
