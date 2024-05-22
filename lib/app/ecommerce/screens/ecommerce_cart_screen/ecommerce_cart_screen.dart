import 'package:basic/app/ecommerce/products_database/products_database.dart';
import 'package:basic/app/themes/borders.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:basic/app/themes/fonts.dart';
import 'package:basic/app/themes/shadows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dotted_line/dotted_line.dart';
import '../../../themes/app_colors.dart';
import 'ecommerce_cart_screen_controller.dart';
import 'ecommerce_cart_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class EcommerceCartScreen
    extends BaseStatelessWidget<
        EcommerceCartScreenController,
        EcommerceCartScreenCubit,
        EcommerceCartScreenState> {

  EcommerceCartScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EcommerceCartScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<EcommerceCartScreenCubit, EcommerceCartScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final product = ProductsDatabase.cartItems[0];
          double productPrice = product.price * state.productCount;
          return Scaffold(
            backgroundColor: AppColors.white,
            body: Container(
              margin: edge_insets_t_24,
              padding: edge_insets_t_16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: edge_insets_x_16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: AppColors.textHeading,
                            ),
                            onPressed: (){
                              context.pop();
                            },
                            icon: Icon(Icons.chevron_left, color: AppColors.white,)
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [shadows.bs_cart],
                            borderRadius: borderRadius.br_100
                          ),
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              IconButton(
                                  style: IconButton.styleFrom(
                                    backgroundColor: AppColors.white,
                                  ),
                                  onPressed: (){},
                                  icon: Icon(Icons.shopping_bag_outlined)
                              ),
                              CircleAvatar(
                                backgroundColor: AppColors.textHeading,
                                radius: 8,
                                child: Text(ProductsDatabase.cartItems.length.toString(), style: TextStyle(
                                  fontSize: Fonts.fontSize7,
                                  fontWeight: Fonts.f600
                                ),),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 24,),
                  Container(
                    padding: edge_insets_x_16,
                    child: Text("My Cart", style: TextStyle(
                        fontSize: Fonts.fontSize18,
                        fontWeight: Fonts.f700
                    ),),
                  ),
                  Container(
                    padding: edge_insets_x_16,
                    height: MediaQuery.sizeOf(context).height/5,
                      child: ListView.builder(
                        padding: edge_insets_t_16,
                        itemCount: ProductsDatabase.cartItems.length,
                        itemBuilder: (context, index) {
                          return ProductsDatabase.cartItems.isNotEmpty
                          ? Container(
                            padding: edge_insets_16,
                            margin: edge_insets_b_16,
                            decoration: BoxDecoration(
                                borderRadius: borderRadius.br_20,
                                boxShadow: [shadows.bs_cart],
                                color: AppColors.white
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(product.imagePath, width: 80, height: 80,),
                                        Container(
                                          margin: edge_insets_l_9,
                                          height: 80,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(product.name, style: TextStyle(
                                                      fontWeight: Fonts.f600,
                                                      fontSize: Fonts.fontSize14
                                                  ),),
                                                  Text(product.category, style: TextStyle(
                                                      fontSize: Fonts.fontSize11
                                                  ),),
                                                ],
                                              ),
                                              Text('\$ ${productPrice.toStringAsFixed(2)}', style: TextStyle(
                                                  fontSize: Fonts.fontSize14,
                                                  fontWeight: Fonts.f700
                                              ),)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: AppColors.grey2,
                                          borderRadius: borderRadius.br_30
                                      ),
                                      child: Row(
                                        children: [
                                          IconButton(
                                              onPressed: (){
                                                getCubit(context).decreaseCount();
                                              },
                                              icon: Icon(Icons.remove)
                                          ),
                                          Text(state.productCount.toString()),
                                          IconButton(
                                              onPressed: (){
                                                getCubit(context).increaseCount();
                                              },
                                              icon: Icon(Icons.add)
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                          : Center(
                            child: Container(
                              padding: edge_insets_y_12,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: borderRadius.br_10
                              ),
                              margin: edge_insets_t_16,
                              child: Column(
                                children: [
                                  Image.asset("images/nothing.png"),
                                  Text("Oh no! you have to add something", style: TextStyle(
                                      fontWeight: Fonts.f500,
                                      fontSize: Fonts.fontSize16
                                  ),),
                                  Text("There are nothing present", style: TextStyle(
                                      fontSize: Fonts.fontSize16
                                  ),)
                                ],
                              ),
                            ),
                          );
                        },
                      )
                  ),
                  SizedBox(height: 24,),
                  DottedLine(
                    lineThickness: 1.0,
                    dashLength: 10.0,
                    dashColor: AppColors.grey3
                  ),
                  SizedBox(height: 16,),
                  Container(
                    margin: edge_insets_x_16,
                    padding: edge_insets_x_16_y_10,
                    decoration: BoxDecoration(
                      color: AppColors.greyWhite,
                      borderRadius: borderRadius.br_10
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width/1.5,
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Promo Code',
                              hintStyle: TextStyle(
                                fontSize: Fonts.fontSize13,
                              )
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.textHeading,
                            shape: RoundedRectangleBorder(borderRadius: borderRadius.br_10)
                          ),
                            onPressed: (){},
                            child: Text("Apply", style: TextStyle(
                              fontWeight: Fonts.f600,
                              fontSize: Fonts.fontSize11,
                              color: AppColors.white
                            ),)
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            bottomNavigationBar: Container(
              padding: edge_insets_24,
              height: MediaQuery.sizeOf(context).height/5,
              decoration: BoxDecoration(
                boxShadow: [shadows.bs_primary],
                color: AppColors.white,
                borderRadius: borderRadius.br_t_30
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total (1 item):", style: TextStyle(
                        fontWeight: Fonts.f600,
                        fontSize: Fonts.fontSize14,
                        color: AppColors.grey1
                      ),),
                      Text('\$ ${productPrice.toStringAsFixed(2)}', style: TextStyle(
                        fontSize: Fonts.fontSize20,
                        fontWeight: Fonts.f600
                      ),),
                    ],
                  ),
                  SizedBox(height: 17,),
                  Row(
                    children: [
                      Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.textHeading,
                              shape: RoundedRectangleBorder(borderRadius: borderRadius.br_10)
                            ),
                              onPressed: (){
                              getCubit(context).openRazorpayPaymentLink('https://rzp.io/l/nibOhHXt', productPrice);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Proceed to Checkout', style: TextStyle(
                                    fontWeight: Fonts.f600,
                                    fontSize: Fonts.fontSize16,
                                    color: AppColors.white
                                  ),),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: borderRadius.br_10,
                                      color: AppColors.white
                                    ),
                                    child: Icon(Icons.chevron_right, color: AppColors.textHeading,),
                                  )
                                ],
                              )
                          )
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  EcommerceCartScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    EcommerceCartScreenCubit cubit = EcommerceCartScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
