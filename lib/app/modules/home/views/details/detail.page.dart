import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/entities/product.type.dart';

import '../tab-home/tab-home.controller.dart';
import 'components/addCartController.dart';
import 'components/reviews.dart';
import 'detail.controller.dart';

class DetailPage extends GetView<DetailController> {
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalles del Producto'),
          backgroundColor: const Color(0xFF222222),
        ),
        body: Column(children: [
          _image(controller),
          const SizedBox(height: 20),
          _center(context, controller),
          const SizedBox(height: 20),
          _bottomButton(context, controller.itemDetail),
        ]));
  }

  static Widget _image(DetailController controller) {
    return SizedBox(
        width: double.infinity,
        child: FadeInImage(
          fit: BoxFit.contain,
          placeholder: const AssetImage('assets/images/loading.gif'),
          image: NetworkImage(controller.itemDetail.imageLink),
        ));
  }

  static Widget _center(BuildContext context, DetailController controller) {
    return Column(
      children: [
        Text(controller.itemDetail.name.toString(),
            style: const TextStyle(fontSize: 25, color: Colors.white)),
        _rateProducts(controller.itemDetail),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, ',
              style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
        const SizedBox(
          height: 10,
        ),
        Text('\$ ${controller.itemDetail.price} MXN',
            style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _bottomButton(constext, Product item) {
    return AddCartControls(
      item,
      altColor: Colors.black,
      labelColor: Colors.white,
    );

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

  static Widget _rateProducts(Product item) {
    return const Reviews();
  }
}
