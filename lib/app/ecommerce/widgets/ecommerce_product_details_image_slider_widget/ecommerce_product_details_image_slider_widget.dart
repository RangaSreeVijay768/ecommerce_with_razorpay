import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'ecommerce_product_details_image_slider_widget_controller.dart';
import 'ecommerce_product_details_image_slider_widget_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';

class EcommerceProductDetailsImageSliderWidget
    extends BaseStatelessWidget<
        EcommerceProductDetailsImageSliderWidgetController,
        EcommerceProductDetailsImageSliderWidgetCubit,
        EcommerceProductDetailsImageSliderWidgetState> {

  String image;
  EcommerceProductDetailsImageSliderWidget(
      {Key? key, super.controller, super.onStateChanged, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EcommerceProductDetailsImageSliderWidgetCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          EcommerceProductDetailsImageSliderWidgetCubit,
          EcommerceProductDetailsImageSliderWidgetState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return CarouselSlider(
            options: CarouselOptions(
              height: 400,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                getCubit(context).onPageChanged(index);
              },
              // Add dots properties
              enlargeFactor: 0.3,
              // onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
            ),
            items: [
              Image.asset(image, fit: BoxFit.fill,
                width: MediaQuery.sizeOf(context).width*2,
                height: MediaQuery.sizeOf(context).height/2.1,
              ),
              Image.asset(image, fit: BoxFit.fill,
                width: MediaQuery.sizeOf(context).width*2,
                height: MediaQuery.sizeOf(context).height/2.1,
              ),
              Image.asset(image, fit: BoxFit.fill,
                width: MediaQuery.sizeOf(context).width*2,
                height: MediaQuery.sizeOf(context).height/2.1,
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  EcommerceProductDetailsImageSliderWidgetCubit createCubitAndAssignToController(
      BuildContext context) {
    EcommerceProductDetailsImageSliderWidgetCubit cubit = EcommerceProductDetailsImageSliderWidgetCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
