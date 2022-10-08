import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:jexpoints/app/components/button/custom_button_transparent.dart';
import 'package:jexpoints/app/shared/values/constants.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/tab-home.controller.dart';

import '../details/detail.controller.dart';
import 'widgets/details.dart';
import 'widgets/expandable.dart';
import 'widgets/header.dart';

class ProductDetailPage extends GetView<DetailController> {
  final home = Get.find<HomeController>();

  ProductDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: 'Detalle de producto'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(),
              const SizedBox(height: 30),
              Details(),
              const SizedBox(height: 15),
              Divider(color: kBorderColor),
              Expandable(
                title: 'Detalles del producto',
                description: controller.itemDetail.description,
                trailing: Container(),
              ),
              // const SizedBox(height: 30),
              // Divider(color: kBorderColor, indent: 15, endIndent: 15),
              // Expandable(
              //   title: 'Reviews',
              //   trailing: Row(
              //     children: List.generate(
              //         3,
              //         (index) => const Icon(
              //               Icons.star,
              //               color: Colors.amber,
              //               size: 20,
              //             )),
              //   ),
              //   description: 'No hay reviews',
              // ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ButtonTransparent(
                    paddingHorizontal: 0,
                    paddingVertical: 0,
                    text: 'Agregar al carrito',
                    onPressed: () {
                      home.addCart(controller.itemDetail, context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget arrowBack() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        size: 30,
      ),
      onPressed: () {
        Get.back();
      },
    ),
  );
}
