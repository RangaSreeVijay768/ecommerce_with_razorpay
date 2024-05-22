part of 'ecommerce_main_screen_cubit.dart';

@freezed
class EcommerceMainScreenState with _$EcommerceMainScreenState {
  const factory EcommerceMainScreenState.initial({
    @Default("HOME") String selectedWidgetName,
    }) = _Initial;
}
