import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/ecommerce/products_database/products_database.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';

import 'package:get_it/get_it.dart';

part 'ecommerce_home_screen_state.dart';

part 'ecommerce_home_screen_cubit.freezed.dart';

class EcommerceHomeScreenCubit extends BaseCubit<EcommerceHomeScreenState> {
  EcommerceHomeScreenCubit({required super.context, String? selectedWidget})
      : super(initialState: EcommerceHomeScreenState.initial());
}
