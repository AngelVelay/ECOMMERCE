import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:jexpoints/app/modules/home/views/details/detail.controller.dart';
import 'package:jexpoints/app/modules/home/views/product-detail/components/size.config.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/tab-home.controller.dart';

import 'components/add-btn.dart';
import 'components/rounded-btn.dart';

class DetailProductPage extends GetView<DetailController> {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      _productImages(controller),
      topRoundedContainer(context, controller)
    ]);
  }
}

Widget _productImages(DetailController controller) {
  return Column(
    children: [
      SizedBox(
        width: controller.getProportionateScreenWidth(238),
        child: AspectRatio(
          aspectRatio: 1,
          child: Hero(
            tag: controller.itemDetail.id,
            child: Image.network(controller.itemDetail.imageLink),
          ),
        ),
      ),
      // SizedBox(height: getProportionateScreenWidth(20)),
    ],
  );
}

Widget topRoundedContainer(context, controller) {
  return Container(
    margin: EdgeInsets.only(top: controller.getProportionateScreenWidth(20)),
    padding: EdgeInsets.only(top: controller.getProportionateScreenWidth(20)),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
    ),
    child: Column(
      children: [
        productDescription(context, controller),
        Container(
          color: Colors.black,
          child: Column(
            children: [
              RoundedIconBtn(
                icon: Icons.remove,
                press: () {},
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: controller.screenWidth * 0.15,
                    right: controller.screenWidth * 0.15,
                    bottom: controller.getProportionateScreenWidth(40),
                    top: controller.getProportionateScreenWidth(15),
                  ),
                  child: DefaultButton(
                    text: "Add To Cart",
                    press: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget productDescription(context, DetailController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: controller.getProportionateScreenWidth(20)),
        child: Text(
          controller.itemDetail.name.toString(),
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(controller.getProportionateScreenWidth(15)),
            width: controller.getProportionateScreenWidth(64),
            decoration: BoxDecoration(
              color: controller.itemDetail.isActive
                  ? Color(0xFFFFE6E6)
                  : Color(0xFFF5F6F9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Icon(
              Icons.favorite,
              color: controller.itemDetail.isActive
                  ? Color(0xFFFF4848)
                  : Color(0xFFDBDEE4),
              size: controller.getProportionateScreenWidth(16),
            ),
          )),
      Padding(
        padding: EdgeInsets.only(
          left: controller.getProportionateScreenWidth(20),
          right: controller.getProportionateScreenWidth(64),
        ),
        child: Text(
          controller.itemDetail.description.toString(),
          maxLines: 3,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: controller.getProportionateScreenHeight(20),
          vertical: 10,
        ),
        child: GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Text(
                '\$ ${controller.itemDetail.price} MXN',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
              ),
              SizedBox(width: 5),
              Icon(
                Icons.arrow_forward_ios,
                size: 12,
                color: Colors.black,
              ),
            ],
          ),
        ),
      )
    ],
  );
}
