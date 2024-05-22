import 'package:basic/app/ecommerce/products_database/products_database.dart';
import 'package:basic/app/ecommerce/screens/ecommerce_cart_screen/ecommerce_cart_screen.dart';
import 'package:basic/app/ecommerce/widgets/ecommerce_home_get_all_products_widget/ecommerce_home_get_all_products_widget.dart';
import 'package:basic/app/ecommerce/widgets/ecommerce_home_get_all_products_widget/ecommerce_home_get_all_products_widget_controller.dart';
import 'package:basic/app/ecommerce/widgets/ecommerce_product_details_image_slider_widget/ecommerce_product_details_image_slider_widget.dart';
import 'package:basic/app/themes/app_colors.dart';
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

import 'ecommerce_product_details_screen_controller.dart';
import 'ecommerce_product_details_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class EcommerceProductDetailsScreen
    extends BaseStatelessWidget<
        EcommerceProductDetailsScreenController,
        EcommerceProductDetailsScreenCubit,
        EcommerceProductDetailsScreenState> {
  int selectedIndex;
  List<String> sizes = [
    'S', 'M', 'L', 'XL', 'XXL'
  ];

  EcommerceProductDetailsScreen(
      {Key? key, super.controller, super.onStateChanged, required this.selectedIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<EcommerceProductDetailsScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          EcommerceProductDetailsScreenCubit,
          EcommerceProductDetailsScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final product = ProductsDatabase.availableProducts[selectedIndex];
          double totalPrice = product.price * state.productCount;
          final likedProduct = ProductsDatabase.likedItems.any((item) => item.id == product.id);
          return Scaffold(
            body: Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: AppColors.grey2,
              ),
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      EcommerceProductDetailsImageSliderWidget(image: product.imagePath),
                      // Image.asset(product.imagePath,
                      //   width: MediaQuery.sizeOf(context).width,
                      //   height: MediaQuery.sizeOf(context).height/2.1,
                      //   fit: BoxFit.fill,
                      // ),
                      Container(
                        height: MediaQuery.sizeOf(context).height/2.3,
                        margin: edge_insets_t_24,
                        padding: edge_insets_16,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    style: IconButton.styleFrom(
                                        backgroundColor: AppColors.textHeading
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 30,),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 5,
                                      backgroundColor: AppColors.grey4,
                                    ),
                                    SizedBox(width: 10,),
                                    CircleAvatar(
                                      radius: 5,
                                      backgroundColor: AppColors.grey4,
                                    ),
                                    SizedBox(width: 10,),
                                    CircleAvatar(
                                      radius: 5,
                                      backgroundColor: AppColors.grey4,
                                    )
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [shadows.bs_cart],
                                      borderRadius: borderRadius.br_100
                                  ),
                                  child: IconButton(
                                      onPressed: () {
                                        likedProduct? getCubit(context).removeLikedProduct(product.id)
                                            :getCubit(context).likeProduct(product.id);
                                        ProductsDatabase.loadLikedProducts();
                                      },
                                      style: IconButton.styleFrom(
                                          backgroundColor: likedProduct
                                              ? AppColors.textHeading
                                              : AppColors.white,
                                          side: BorderSide(color: likedProduct
                                              ? AppColors.textHeading
                                              : AppColors.white, width: 1)
                                      ),
                                      icon: Icon(
                                        Icons.favorite_border,
                                        color: likedProduct
                                            ? AppColors.white
                                            : AppColors.textHeading,
                                        size: 20,
                                      )),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: edge_insets_24,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: borderRadius.br_t_20
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(product.name,style: TextStyle(
                                          fontWeight: Fonts.f600,
                                          fontSize: Fonts.fontSize18
                                      ),),
                                      SizedBox(height: 5,),
                                      Text(product.category, style: TextStyle(
                                        fontSize: Fonts.fontSize11,
                                      ),),
                                      SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          Icon(Icons.star, color: AppColors.coinProgress,),
                                          Text("(${product.ratings} Review)", style: TextStyle(
                                              fontSize: Fonts.fontSize11
                                          ),)
                                        ],
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
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
                                      SizedBox(height: 11,),
                                      Text("Available in stock", style: TextStyle(
                                          fontSize: Fonts.fontSize11,
                                          fontWeight: Fonts.f600
                                      ),)
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 26,),
                                      Text("Size", style: TextStyle(
                                          fontWeight: Fonts.f600,
                                          fontSize: Fonts.fontSize16
                                      ),),
                                      SizedBox(height: 12,),
                                      Container(
                                        width: MediaQuery.sizeOf(context).width/1.4,
                                        height: 40,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                            itemCount: sizes.length,
                                            itemBuilder: (context, index){
                                              return InkWell(
                                                onTap: (){
                                                  getCubit(context).selectSize(index);
                                                },
                                                child: Container(
                                                  margin: edge_insets_r_15,
                                                  alignment: Alignment.center,
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                      border: borders.b_1px_grey2,
                                                      color: state.selectedSize == index
                                                          ? AppColors.textHeading
                                                          : AppColors.transparent,
                                                      borderRadius: borderRadius.br_100
                                                  ),
                                                  child: Text(sizes[index], style: TextStyle(
                                                      fontSize: Fonts.fontSize14,
                                                      fontWeight: Fonts.f600,
                                                      color: state.selectedSize == index
                                                      ? AppColors.white : AppColors.grey4
                                                  ),),
                                                ),
                                              );
                                            }
                                        ),
                                      ),
                                      SizedBox(height: 25,),
                                      Text("Description", style: TextStyle(
                                          fontWeight: Fonts.f600,
                                          fontSize: Fonts.fontSize16
                                      ),)
                                    ],
                                  ),
                                  Container(
                                    padding: edge_insets_10,
                                    decoration: BoxDecoration(
                                        borderRadius: borderRadius.br_30,
                                        boxShadow: [shadows.bs_grey],
                                        color: AppColors.white
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              border: borders.b_1px_grey2,
                                              borderRadius: borderRadius.br_100,
                                              color: AppColors.white
                                          ),
                                          child: Icon(Icons.check, size: 20,),
                                        ),
                                        SizedBox(height: 5,),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              border: borders.b_1px_grey2,
                                              borderRadius: borderRadius.br_100,
                                              color: AppColors.textHeading
                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              border: borders.b_1px_grey2,
                                              borderRadius: borderRadius.br_100,
                                              color: Colors.lightGreen
                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              border: borders.b_1px_grey2,
                                              borderRadius: borderRadius.br_100,
                                              color: AppColors.coinProgress
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15,),
                              Text(product.description, style: TextStyle(
                                  fontSize: Fonts.fontSize11,
                                  color: AppColors.grey4
                              ),),
                              SizedBox(height: 28,),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Total price", style: TextStyle(
                                          fontSize: Fonts.fontSize10,
                                          fontWeight: Fonts.f500,
                                          color: AppColors.grey1
                                      ),),
                                      Text('\$ ${totalPrice.toStringAsFixed(2)}', style: TextStyle(
                                          fontWeight: Fonts.f700,
                                          fontSize: Fonts.fontSize18
                                      ),)
                                    ],
                                  ),
                                  SizedBox(width: 40,),
                                  Expanded(
                                      child: TextButton.icon(
                                          style: TextButton.styleFrom(
                                              backgroundColor: AppColors.textHeading,
                                              padding: edge_insets_y_16
                                          ),
                                          onPressed: (){
                                            getCubit(context).addToCart(product);
                                          },
                                          icon: Icon(Icons.shopping_bag_outlined, color: AppColors.white, size: 24,),
                                          label: Text("Add to cart", style: TextStyle(
                                            fontSize: Fonts.fontSize16,
                                            fontWeight: Fonts.f600,
                                            color: AppColors.white
                                          ),)
                                      )
                                  )
                                ],
                              ),
                              SizedBox(height: 16,)
                            ],
                          )
                        ),
                      )
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
  EcommerceProductDetailsScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    EcommerceProductDetailsScreenCubit cubit = EcommerceProductDetailsScreenCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
