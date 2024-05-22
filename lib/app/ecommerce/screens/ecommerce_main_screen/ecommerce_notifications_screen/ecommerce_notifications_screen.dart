import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'ecommerce_notifications_screen_controller.dart';
import 'ecommerce_notifications_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class EcommerceNotificationsScreen
    extends BaseStatelessWidget<
        EcommerceNotificationsScreenController,
        EcommerceNotificationsScreenCubit,
        EcommerceNotificationsScreenState> {

  EcommerceNotificationsScreen(
      {Key? key, super.controller, super.onStateChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EcommerceNotificationsScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          EcommerceNotificationsScreenCubit,
          EcommerceNotificationsScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Center(
            child: Text("NOTIFICATIONS"),
          );
        },
      ),
    );
  }

  @override
  EcommerceNotificationsScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    EcommerceNotificationsScreenCubit cubit = EcommerceNotificationsScreenCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
