import 'package:basic/app/ecommerce/screens/ecommerce_liked_products_screen/ecommerce_liked_products_screen.dart';
import 'package:basic/app/ecommerce/screens/ecommerce_product_details_screen/ecommerce_product_details_screen.dart';
import 'package:basic/app/ecommerce/widgets/ecommerce_home_drawer_widget/ecommerce_home_drawer_widget.dart';
import 'package:basic/app/ecommerce/widgets/ecommerce_home_get_all_products_widget/ecommerce_home_get_all_products_widget.dart';
import 'package:basic/app/ecommerce/widgets/ecommerce_home_image_slider_widget/ecommerce_home_image_slider_widget.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:basic/app/themes/borders.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:basic/app/themes/fonts.dart';
import 'package:basic/app/themes/shadows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../products_database/products_database.dart';
import 'ecommerce_home_screen_controller.dart';
import 'ecommerce_home_screen_cubit.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class EcommerceHomeScreen
    extends BaseStatelessWidget<
        EcommerceHomeScreenController,
        EcommerceHomeScreenCubit,
        EcommerceHomeScreenState> {

  EcommerceHomeScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _openDrawer() {
    if (_scaffoldKey.currentState != null) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider<EcommerceHomeScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<EcommerceHomeScreenCubit, EcommerceHomeScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Scaffold(
            key: _scaffoldKey,
            drawer: EcommerceHomeDrawerWidget(),
            body: Stack(
              alignment: Alignment.topCenter,
              children: [
                SingleChildScrollView(
                  child: Container(
                    margin: edge_insets_b_170,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 100,),
                        Container(
                          padding: edge_insets_x_16,
                          child: Text('Welcome',
                            style: TextStyle(
                              shadows: [shadows.bs_grey],
                            fontWeight: Fonts.f600,
                            fontSize: Fonts.fontSize25
                          ),),
                        ),
                        Container(
                          margin: edge_insets_b_16,
                          padding: edge_insets_x_16,
                          child: Text('Our Fashion App', style: TextStyle(
                              fontWeight: Fonts.f300,
                              fontSize: Fonts.fontSize20
                          ),),
                        ),
                        Container(
                          margin: edge_insets_t_4,
                          padding: edge_insets_x_10,
                          child: Row(
                            children: [
                              Container(
                                margin: edge_insets_l_10,
                                height: 50,
                                width: MediaQuery.sizeOf(context).width / 1.45,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: borderRadius.br_30,
                                  boxShadow: [shadows.bs_grey],
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search...',
                                    prefixIcon: Icon(Icons.search),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => EcommerceLikedProductsScreen()));
                                },
                                child: Container(
                                  margin: edge_insets_l_16,
                                  padding: edge_insets_10,
                                  alignment: Alignment.centerLeft,
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    boxShadow: [shadows.bs_grey],
                                    color: AppColors.textHeading,
                                    borderRadius: borderRadius.br_100,
                                  ),
                                  child: Icon(CupertinoIcons.slider_horizontal_3, size: 20, color: AppColors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.sizeOf(context).height / 3.798,
                          child: EcommerceHomeImageSliderWidget(),
                        ),
                        Container(
                          margin: edge_insets_l_16,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "New Arrivals",
                                style: TextStyle(
                                  fontWeight: Fonts.f700,
                                  fontSize: Fonts.fontSize18,
                                ),
                              ),
                              Container(
                                height: 30,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: edge_insets_x_16,
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "View All",
                                    style: TextStyle(
                                      fontSize: Fonts.fontSize11,
                                      fontWeight: Fonts.f600,
                                      color: AppColors.grey4,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: edge_insets_x_16,
                          child: EcommerceHomeGetAllProductsWidget(),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: edge_insets_l_10_t_12,
                  padding: edge_insets_16,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [shadows.bs_grey]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: edge_insets_l_10,
                        child: IconButton(
                          onPressed: _openDrawer,
                          style: IconButton.styleFrom(
                            backgroundColor: AppColors.textHeading,
                          ),
                          icon: Icon(Icons.notes_outlined, color: AppColors.white),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EcommerceLikedProductsScreen()));
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: AppColors.grey2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  EcommerceHomeScreenCubit createCubitAndAssignToController(BuildContext context) {
    EcommerceHomeScreenCubit cubit = EcommerceHomeScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
