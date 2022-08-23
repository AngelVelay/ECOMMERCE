import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/form-controls/custom-rounded-button.widget.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/components/cart-controls.widget.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/tab-home.controller.dart';
import 'package:jexpoints/app/modules/store/views/tab-shopping-cart/tab-shoppin-cart.page.dart';

import '../../../home/entities/flyer.type.dart';
import '../../../main/entities/product.type.dart';
import 'interested-products/interested-products.page.dart';
import 'products-for-you/products-for-you.page.dart';

class SuggestionsPage extends GetView<HomeController> {
  const SuggestionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text('Sugerencias'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Badge(
                  animationType: BadgeAnimationType.fade,
                  badgeColor: Colors.black,
                  badgeContent: Text(
                    '${controller.cartItems$}',
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  child: Icon(Icons.shopping_cart),
                ),
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShoppingCartPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 20),
            Expanded(child: _flyerList(controller)),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductsForYou(),
                    SizedBox(height: 20),
                    InterestedProducts(),
                  ],
                ),
              ),
            ),
            _button(controller)
          ],
        ),
      );
    }));
  }
}

Widget _flyerList(controller) {
  return ListView(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: [
      Obx(() {
        return CarouselSlider.builder(
          itemCount: controller.flyerList$.length,
          itemBuilder: (context, index, realIndex) {
            return controller.flyerList$.isNotEmpty
                ? _flyerItem(controller.flyerList$[index])
                : Container();
          },
          options: CarouselOptions(
            height: 150,
            autoPlay: true,
            scrollDirection: Axis.horizontal,
          ),
        );
      })
    ],
  );
}

Widget _flyerItem(Flyer item) {
  return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
          width: 600,
          height: 600,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: GestureDetector(
                onTap: () {},
                child: FadeInImage(
                  width: 600,
                  fit: BoxFit.fill,
                  placeholder: const NetworkImage(
                      'https://acegif.com/wp-content/uploads/loading-11.gif'),
                  image: AssetImage(item.url),
                ),
              ))));
}

Widget _button(controller) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
        width: double.infinity,
        child: CustomRoundedButton(
          text: 'Proceder a pagar',
          onPressed: () {
            controller.toCheckout();
          },
        )),
  );
}
