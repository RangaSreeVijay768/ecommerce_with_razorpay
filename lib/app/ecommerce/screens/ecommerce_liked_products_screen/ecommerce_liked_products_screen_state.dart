part of 'ecommerce_liked_products_screen_cubit.dart';

@freezed
class EcommerceLikedProductsScreenState
    with _$EcommerceLikedProductsScreenState {
  const factory EcommerceLikedProductsScreenState.initial({
    required List<ProductsDatabase> likedProducts,
}) = _Initial;
}
