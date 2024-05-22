import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/ecommerce/products_database/products_database.dart';
import 'package:basic/app/ecommerce/screens/ecommerce_liked_products_screen/ecommerce_liked_products_screen.dart';
import 'package:basic/app/ecommerce/screens/ecommerce_product_details_screen/ecommerce_product_details_screen.dart';
import 'package:basic/app/themes/borders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:go_router/go_router.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/edge_insets.dart';
import '../../../themes/fonts.dart';
import 'ecommerce_home_get_all_products_widget_controller.dart';
import 'ecommerce_home_get_all_products_widget_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';




class EcommerceHomeGetAllProductsWidget extends BaseStatelessWidget<
    EcommerceHomeGetAllProductsWidgetController,
    EcommerceHomeGetAllProductsWidgetCubit,
    EcommerceHomeGetAllProductsWidgetState> {
  EcommerceHomeGetAllProductsWidget(
      {Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EcommerceHomeGetAllProductsWidgetCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<EcommerceHomeGetAllProductsWidgetCubit,
          EcommerceHomeGetAllProductsWidgetState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return GridView.builder(
              padding: edge_insets_t_16,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.69,
                  mainAxisSpacing: 16),
              itemCount: ProductsDatabase.availableProducts.length,
              itemBuilder: (context, index) {
                final product = ProductsDatabase.availableProducts[index];
                final likedProduct = ProductsDatabase.likedItems.any((item) => item.id == product.id);
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EcommerceProductDetailsScreen(
                                selectedIndex: index)));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      Container(
                        alignment: Alignment.topRight,
                        height: 170,
                        width: MediaQuery.sizeOf(context).width / 2,
                        decoration: BoxDecoration(
                            color: AppColors.grey2,
                            image: DecorationImage(
                                image: AssetImage(product.imagePath),
                                fit: BoxFit.fill),
                            borderRadius: borderRadius.br_16),
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
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        product.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: Fonts.fontSize14, fontWeight: Fonts.f600),
                      ),
                      Text(
                        product.category,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Fonts.fontSize11,
                          color: AppColors.grey4,
                        ),
                      ),
                      Text(
                        '\$ ${product.price}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Fonts.fontSize14,
                          fontWeight: Fonts.f600,
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }

  @override
  EcommerceHomeGetAllProductsWidgetCubit createCubitAndAssignToController(
      BuildContext context) {
    EcommerceHomeGetAllProductsWidgetCubit cubit =
        EcommerceHomeGetAllProductsWidgetCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
