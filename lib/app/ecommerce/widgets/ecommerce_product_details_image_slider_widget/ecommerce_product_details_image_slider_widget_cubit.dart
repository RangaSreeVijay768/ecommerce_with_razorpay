import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';

import 'package:get_it/get_it.dart';

part 'ecommerce_product_details_image_slider_widget_state.dart';

part 'ecommerce_product_details_image_slider_widget_cubit.freezed.dart';

class EcommerceProductDetailsImageSliderWidgetCubit
    extends BaseCubit<EcommerceProductDetailsImageSliderWidgetState> {
  EcommerceProductDetailsImageSliderWidgetCubit({required super.context})
      : super(
      initialState: EcommerceProductDetailsImageSliderWidgetState.initial(currentImage: 0));

  void onPageChanged(int index) {
    emit(state.copyWith(currentImage: index));
  }

}
