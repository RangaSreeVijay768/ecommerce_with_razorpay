part of 'ecommerce_home_get_all_products_widget_cubit.dart';

@freezed
class EcommerceHomeGetAllProductsWidgetState
    with _$EcommerceHomeGetAllProductsWidgetState {
  const factory EcommerceHomeGetAllProductsWidgetState.initial({
    required List<ProductsDatabase> likedProducts,
    @Default(BooleanStatus.initial) BooleanStatus likedStatus,
  }) = _Initial;
}
