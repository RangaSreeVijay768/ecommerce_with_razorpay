import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'ecommerce_accounts_screen_controller.dart';
import 'ecommerce_accounts_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class EcommerceAccountsScreen
    extends BaseStatelessWidget<
        EcommerceAccountsScreenController,
        EcommerceAccountsScreenCubit,
        EcommerceAccountsScreenState> {

  EcommerceAccountsScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EcommerceAccountsScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          EcommerceAccountsScreenCubit,
          EcommerceAccountsScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Center(
            child: Text("ACCOUNTS"),
          );
        },
      ),
    );
  }

  @override
  EcommerceAccountsScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    EcommerceAccountsScreenCubit cubit = EcommerceAccountsScreenCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
