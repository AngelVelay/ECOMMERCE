import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/home/entities/impulse-products.type.dart';
import 'package:jexpoints/app/modules/home/views/details/components/reviews.dart';
import 'package:jexpoints/app/modules/main/entities/product.type.dart';

import '../../tab-home/tab-home.controller.dart';
import '../detail.controller.dart';
import 'addCartController.dart';

class DetailTopProductsPage extends GetView<DetailController> {
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalles del Product'),
          backgroundColor: const Color(0xFF222222),
        ),
        body: Column(children: [
          Expanded(child: _image(controller)),
          const SizedBox(height: 20),
          _center(context, controller),
          const SizedBox(height: 20),
          // _bottomButton(context, controller.itemDetail),
        ]));
  }

  static Widget _image(DetailController controller) {
    return SizedBox(
        width: double.infinity,
        height: 300,
        child: FadeInImage(
          fit: BoxFit.contain,
          placeholder: const AssetImage('assets/images/loading.gif'),
          image: NetworkImage(controller.topProductItem[0]),
        ));
  }

  static Widget _center(BuildContext context, DetailController controller) {
    return Column(
      children: [
        Text(controller.topProductItem[1],
            style: const TextStyle(fontSize: 25, color: Colors.white)),
        _rateProducts(controller.topProductItem[4]),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(controller.topProductItem[2],
              style: const TextStyle(fontSize: 16, color: Colors.white)),
        ),
        const SizedBox(
          height: 10,
        ),
        Text('\$ ${controller.topProductItem[3]} MXN',
            style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ],
    );
  }

  // Widget _bottomButton(constext, Product item) {
  //   return AddCartControls(
  //     item,
  //     altColor: Colors.black,
  //     labelColor: Colors.white,
  //   );

  // return Container(
  //   margin: const EdgeInsets.symmetric(horizontal: 10),
  //   padding: const EdgeInsets.symmetric(horizontal: 15),
  //   child: GestureDetector(
  //     onTap: () {
  //       Get.toNamed('generate-qr', arguments: {"type": "change"});
  //     },
  //     child: Container(
  //       height: 60,
  //       decoration: BoxDecoration(
  //           color: const Color(0xFF222222),
  //           borderRadius: BorderRadius.circular(20)),
  //           child: addCartControls(item),
  //       // child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
  //       //   const Icon(
  //       //     Icons.add_shopping_cart,
  //       //     color: Colors.white,
  //       //   ),
  //       //   const SizedBox(width: 10),

  //       //   // Text(
  //       //   //   'Agregar al carrito \$ ${controller.points} ',
  //       //   //   style: const TextStyle(color: Colors.white, fontSize: 24),
  //       //   // )
  //       // ]),
  //     ),
  //   ),
  // );
}

Widget _rateProducts(Product item) {
  return const Reviews();
}
