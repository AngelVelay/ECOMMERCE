import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/cart/entities/product.type.dart';
import 'package:jexpoints/app/modules/home/views/details_screen/widgets/constants.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/tab-home.controller.dart';

import '../../details/detail.controller.dart';

class Details extends GetView<DetailController> {
  final home = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 300,
                child: Text(
                  controller.itemDetail.name,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Obx((() {
                return Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                        onTap: () {
                          home.addFavorite(controller.itemDetail);
                        },
                        child: home.likedProducts$
                                .where((element) =>
                                    element.id == controller.itemDetail.id)
                                .isNotEmpty
                            ? GestureDetector(
                                onTap: (() =>
                                    home.deleteFavorite(controller.itemDetail)),
                                child: const Icon(Icons.favorite,
                                    color: Colors.red),
                              )
                            : GestureDetector(
                                onTap: () =>
                                    home.addFavorite(controller.itemDetail),
                                child: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                              )));
              }))
            ],
          ),
          const SizedBox(height: 10),
          Text(
            controller.itemDetail.id,
            style: const TextStyle(fontSize: 13, color: Colors.white),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove, color: Colors.white),
                onPressed: () {
                  home.deleteCart(controller.itemDetail);
                },
              ),
              Obx((() {
                return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: kBorderColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      home.cartValue$.value ==
                                  controller.itemDetail.cartValue ||
                              home.cartValue$.value == 0
                          ? controller.itemDetail.cartValue.toString()
                          : home.cartValue$.value.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ));
              })),
              IconButton(
                icon: Icon(Icons.add, color: Colors.white),
                onPressed: () {
                  home.addCart(controller.itemDetail, context);
                },
              ),
              Spacer(),
              Text('\$${controller.itemDetail.price}',
                  style: kTitleStyle.copyWith(fontSize: 18))
            ],
          ),
        ],
      ),
    );
  }
}
