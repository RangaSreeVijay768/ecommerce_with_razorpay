import 'package:basic/app/ecommerce/screens/ecommerce_liked_products_screen/ecommerce_liked_products_screen.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:basic/app/themes/borders.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:basic/app/themes/fonts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stroke_text/stroke_text.dart';
import 'ecommerce_home_image_slider_widget_controller.dart';
import 'ecommerce_home_image_slider_widget_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class EcommerceHomeImageSliderWidget
    extends BaseStatelessWidget<
        EcommerceHomeImageSliderWidgetController,
        EcommerceHomeImageSliderWidgetCubit,
        EcommerceHomeImageSliderWidgetState> {

  EcommerceHomeImageSliderWidget(
      {Key? key, super.controller, super.onStateChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EcommerceHomeImageSliderWidgetCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          EcommerceHomeImageSliderWidgetCubit,
          EcommerceHomeImageSliderWidgetState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => EcommerceLikedProductsScreen()));
            },
            child: Container(
              margin: edge_insets_16,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return Container(
                    margin: edge_insets_r_16,
                    padding: edge_insets_16,
                    width: MediaQuery.sizeOf(context).width/1.3,
                    decoration: BoxDecoration(
                        borderRadius: borderRadius.br_30,
                        image: DecorationImage(
                            image: AssetImage("images/handbag.png"),
                            fit: BoxFit.cover
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("50% Off", style: TextStyle(
                            fontWeight: Fonts.f700,
                            fontSize: Fonts.fontSize25
                        ),),
                        Text("On everything today", style: TextStyle(
                            fontSize: Fonts.fontSize16,
                            fontWeight: Fonts.f500
                        ),),
                        SizedBox(height: 10,),
                        StrokeText(
                          text: "With code:FSCREATION",
                          textStyle: TextStyle(
                            fontSize: Fonts.fontSize11,
                            color: AppColors.grey4,
                            fontWeight: Fonts.f600,
                          ),
                          strokeColor: AppColors.textHeading,
                          strokeWidth: 1,
                        ),
                        SizedBox(height: 15,),
                        TextButton(
                            style: TextButton.styleFrom(
                                padding: edge_insets_x_10,
                                backgroundColor: AppColors.textHeading
                            ),
                            onPressed: (){},
                            child: Text("Get Now", style: TextStyle(
                                fontWeight: Fonts.f700,
                                fontSize: Fonts.fontSize10,
                                color: AppColors.white
                            ),)
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  EcommerceHomeImageSliderWidgetCubit createCubitAndAssignToController(
      BuildContext context) {
    EcommerceHomeImageSliderWidgetCubit cubit = EcommerceHomeImageSliderWidgetCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
