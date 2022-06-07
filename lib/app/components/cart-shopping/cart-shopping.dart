import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/main/views/cart-shopping/shopipng-cart.page.dart';
import '../../modules/main/views/tab-home/tab-home.controller.dart';
import '../points/points.widget.dart';

class CartShopping extends GetView<HomeController> {
  const CartShopping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ModalBottomSheetCart(context);
      },
      child: Stack(children: [
        const Icon(
          Icons.shopping_cart,
          color: Colors.white,
          size: 40,
        ),
        Obx(() {
          return PointsViewer(
              size: 23, value: '${controller.cartItems$}', fontSize: 11);
        })
      ]),
    );
  }
}

Future<dynamic> ModalBottomSheetCart(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Container(
            height: MediaQuery.of(context).size.height * 0.80,
            child: ShoppingCart());
      });
}
