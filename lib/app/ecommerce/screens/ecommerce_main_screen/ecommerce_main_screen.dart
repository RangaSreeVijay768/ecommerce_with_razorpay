import 'package:basic/app/ecommerce/screens/ecommerce_cart_screen/ecommerce_cart_screen.dart';
import 'package:basic/app/ecommerce/screens/ecommerce_main_screen/ecommerce_accounts_screen/ecommerce_accounts_screen.dart';
import 'package:basic/app/ecommerce/screens/ecommerce_main_screen/ecommerce_home_screen/ecommerce_home_screen.dart';
import 'package:basic/app/ecommerce/screens/ecommerce_main_screen/ecommerce_notifications_screen/ecommerce_notifications_screen.dart';
import 'package:basic/app/themes/borders.dart';
import 'package:basic/app/themes/shadows.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/edge_insets.dart';
import '../../../themes/fonts.dart';
import '../ecommerce_product_details_screen/ecommerce_product_details_screen.dart';
import 'ecommerce_main_screen_controller.dart';
import 'ecommerce_main_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class EcommerceMainScreen
    extends BaseStatelessWidget<
        EcommerceMainScreenController,
        EcommerceMainScreenCubit,
        EcommerceMainScreenState> {

  EcommerceMainScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key){
    tabWidgets = {
      'HOME': EcommerceHomeScreen(),
      'CART': EcommerceCartScreen(),
      'NOTIFICATIONS': EcommerceNotificationsScreen(),
      'ACCOUNT': EcommerceAccountsScreen(),
    };
  }
  late final Map<String, Widget> tabWidgets;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EcommerceMainScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<EcommerceMainScreenCubit, EcommerceMainScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Scaffold(
            body: tabWidgets[state.selectedWidgetName],
            floatingActionButton: Container(
              decoration: const BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [shadows.bs_primary],
                  borderRadius: borderRadius.br_t_30
              ),
              alignment: Alignment.center,
              height: 80,
              padding: edge_insets_x_7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: state.selectedWidgetName == 'HOME'
                              ? AppColors.grey2
                              : AppColors.transparent,
                          // shape: RoundedRectangleBorder(),
                          padding: edge_insets_0
                      ),
                      onPressed: () {
                        getCubit(context).selectWidget('HOME');
                      },
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: state.selectedWidgetName == 'HOME'
                                    ? AppColors.textHeading
                                    : AppColors.transparent,
                                borderRadius: borderRadius.br_100
                            ),
                            padding: edge_insets_10,
                            child: Icon(
                              Icons.home,
                              color: state.selectedWidgetName == 'HOME'
                                  ? AppColors.white
                                  : AppColors.textHeading,
                            ),
                          ),
                          SizedBox(width: 4,),
                          state.selectedWidgetName == 'HOME'
                              ? Text("Home", style: TextStyle(
                            color: AppColors.textHeading,
                            fontSize: Fonts.fontSize11,
                            fontWeight: Fonts.f600,
                          ),)
                              : SizedBox(),
                          SizedBox(width: 8,)
                        ],
                      )),
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: state.selectedWidgetName == 'CART'
                              ? AppColors.grey2
                              : AppColors.transparent,
                          // shape: RoundedRectangleBorder(),
                          padding: edge_insets_0
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EcommerceCartScreen()));
                      },
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: state.selectedWidgetName == 'CART'
                                    ? AppColors.textHeading
                                    : AppColors.transparent,
                                borderRadius: borderRadius.br_100
                            ),
                            padding: edge_insets_10,
                            child: Icon(
                              Icons.shopping_cart,
                              color: state.selectedWidgetName == 'CART'
                                  ? AppColors.white
                                  : AppColors.textHeading,
                            ),
                          ),
                          SizedBox(width: 4,),
                          state.selectedWidgetName == 'CART'
                              ? Text("Cart", style: TextStyle(
                            color: AppColors.textHeading,
                            fontSize: Fonts.fontSize11,
                            fontWeight: Fonts.f600,
                          ),)
                              : SizedBox(),
                          SizedBox(width: 8,)
                        ],
                      )),
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: state.selectedWidgetName == 'NOTIFICATIONS'
                              ? AppColors.grey2
                              : AppColors.transparent,
                          // shape: RoundedRectangleBorder(),
                          padding: edge_insets_0
                      ),
                      onPressed: () {
                        getCubit(context).selectWidget('NOTIFICATIONS');
                      },
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: state.selectedWidgetName == 'NOTIFICATIONS'
                                    ? AppColors.textHeading
                                    : AppColors.transparent,
                                borderRadius: borderRadius.br_100
                            ),
                            padding: edge_insets_10,
                            child: Icon(
                              Icons.notifications,
                              color: state.selectedWidgetName == 'NOTIFICATIONS'
                                  ? AppColors.white
                                  : AppColors.textHeading,
                            ),
                          ),
                          SizedBox(width: 4,),
                          state.selectedWidgetName == 'NOTIFICATIONS'
                              ? Text("Notifications", style: TextStyle(
                            color: AppColors.textHeading,
                            fontSize: Fonts.fontSize11,
                            fontWeight: Fonts.f600,
                          ),)
                              : SizedBox(),
                          SizedBox(width: 8,)
                        ],
                      )),
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: state.selectedWidgetName == 'ACCOUNT'
                              ? AppColors.grey2
                              : AppColors.transparent,
                          // shape: RoundedRectangleBorder(),
                          padding: edge_insets_0
                      ),
                      onPressed: () {
                        getCubit(context).selectWidget('ACCOUNT');
                      },
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: state.selectedWidgetName == 'ACCOUNT'
                                    ? AppColors.textHeading
                                    : AppColors.transparent,
                                borderRadius: borderRadius.br_100
                            ),
                            padding: edge_insets_10,
                            child: Icon(
                              Icons.person,
                              color: state.selectedWidgetName == 'ACCOUNT'
                                  ? AppColors.white
                                  : AppColors.textHeading,
                            ),
                          ),
                          SizedBox(width: 4,),
                          state.selectedWidgetName == 'ACCOUNT'
                              ? Text("Account", style: TextStyle(
                            color: AppColors.textHeading,
                            fontSize: Fonts.fontSize11,
                            fontWeight: Fonts.f600,
                          ),)
                              : SizedBox(),
                          SizedBox(width: 8,)
                        ],
                      )),
                ],
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }

  @override
  EcommerceMainScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    EcommerceMainScreenCubit cubit = EcommerceMainScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
