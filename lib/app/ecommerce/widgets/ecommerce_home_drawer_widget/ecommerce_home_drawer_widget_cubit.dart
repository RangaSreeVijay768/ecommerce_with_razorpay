import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';

import 'package:get_it/get_it.dart';

part 'ecommerce_home_drawer_widget_state.dart';

part 'ecommerce_home_drawer_widget_cubit.freezed.dart';

class EcommerceHomeDrawerWidgetCubit
    extends BaseCubit<EcommerceHomeDrawerWidgetState> {
  EcommerceHomeDrawerWidgetCubit({required super.context})
      : super(initialState: EcommerceHomeDrawerWidgetState.initial());
}
