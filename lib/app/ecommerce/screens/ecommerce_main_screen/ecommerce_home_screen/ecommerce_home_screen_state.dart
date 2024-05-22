part of 'ecommerce_home_screen_cubit.dart';

@freezed
class EcommerceHomeScreenState with _$EcommerceHomeScreenState {
  const factory EcommerceHomeScreenState.initial({
    @Default("HOME") String selectedWidgetName,
}) = _Initial;
}
