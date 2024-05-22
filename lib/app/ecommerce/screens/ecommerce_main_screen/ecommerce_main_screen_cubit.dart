import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';

import 'package:get_it/get_it.dart';

part 'ecommerce_main_screen_state.dart';

part 'ecommerce_main_screen_cubit.freezed.dart';

class EcommerceMainScreenCubit extends BaseCubit<EcommerceMainScreenState> {
  EcommerceMainScreenCubit({required super.context, String? selectedWidget})
      : super(initialState: EcommerceMainScreenState.initial(
    selectedWidgetName: selectedWidget ?? 'HOME',
  ));

  selectWidget(String value) {
    emit(state.copyWith(selectedWidgetName: value));
  }

}
