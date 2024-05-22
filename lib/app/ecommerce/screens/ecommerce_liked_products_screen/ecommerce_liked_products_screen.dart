import 'package:basic/app/ecommerce/products_database/products_database.dart';
import 'package:basic/app/ecommerce/screens/ecommerce_cart_screen/ecommerce_cart_screen.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:basic/app/themes/borders.dart';
import 'package:basic/app/themes/shadows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../themes/edge_insets.dart';
import '../../../themes/fonts.dart';
import 'ecommerce_liked_products_screen_controller.dart';
import 'ecommerce_liked_products_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class EcommerceLikedProductsScreen
    extends BaseStatelessWidget<
        EcommerceLikedProductsScreenController,
        EcommerceLikedProductsScreenCubit,
        EcommerceLikedProductsScreenState> {

  EcommerceLikedProductsScreen(
      {Key? key, super.controller, super.onStateChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EcommerceLikedProductsScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          EcommerceLikedProductsScreenCubit,
          EcommerceLikedProductsScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Scaffold(
            backgroundColor: AppColors.grey2,
            body: Container(
                padding: edge_insets_x_16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: edge_insets_t_48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            style: IconButton.styleFrom(
                                backgroundColor: AppColors.textHeading
                            ),
                            onPressed: (){
                              context.pop();
                            },
                            icon: Icon(Icons.chevron_left, color: AppColors.white,),
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
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => EcommerceCartScreen()));
                                    },
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
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12,),
                    Text("Your Liked Fashions", style: TextStyle(
                      fontSize: Fonts.fontSize22,
                      fontWeight: Fonts.f700
                    ),),
                    ProductsDatabase.likedItems.isNotEmpty
                    ? Expanded(child: ListView.builder(
                      padding: edge_insets_t_16,
                      itemCount: ProductsDatabase.likedItems.length,
                      itemBuilder: (context, index) {
                        final product = ProductsDatabase.likedItems[index];
                        return Container(
                          padding: edge_insets_16,
                          margin: edge_insets_b_16,
                          decoration: BoxDecoration(
                              borderRadius: borderRadius.br_20,
                              boxShadow: [shadows.bs_cart],
                              color: AppColors.white
                          ),
                          child: Row(
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
                                        Text('\$ ${product.price.toStringAsFixed(2)}', style: TextStyle(
                                            fontSize: Fonts.fontSize14,
                                            fontWeight: Fonts.f700
                                        ),)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: (){
                                    getCubit(context).removeLikedProduct(product);
                                    ProductsDatabase.loadLikedProducts();
                                  },
                                  icon: Icon(Icons.remove_circle_outline)
                              )
                            ],
                          ),
                        );
                      },
                    ))
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
                    )
                  ],
                )
            ),
          );
        },
      ),
    );
  }

  @override
  EcommerceLikedProductsScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    EcommerceLikedProductsScreenCubit cubit = EcommerceLikedProductsScreenCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
