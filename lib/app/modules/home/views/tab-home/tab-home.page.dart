import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/entities/flyer.type.dart';

import '../../../main/views/variable-products/variable-products.page.dart';
import '../../components/draggable-button.dart';
import 'components/favorite-products.widget.dart';
import 'components/header.widget.dart';
import 'components/top-products.widget.dart';
import 'tab-home.controller.dart';
import 'package:dotted_border/dotted_border.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: false,
      right: false,
      bottom: false,
      child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: HomeHeader(
                  controller,
                  expandedHeight: 150,
                ),
              ),
              SliverToBoxAdapter(
                child: Column(children: [
                  _welcomeGreeting(),
                  _coupons(),
                  const SizedBox(height: 20),
                  _flyerList(),
                  const HomeTopProducts(),
                  const SizedBox(height: 20),
                  const HomeFavoriteProducts(),
                  const SizedBox(height: 20),
                  _socials()
                  // const RositceriaProducts(),
                  // const SizedBox(height: 70),
                ]),
              )
            ],
          ),
          floatingActionButton: DraggableButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniEndTop),
    );
  }

  Widget _welcomeGreeting() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '¡Hola! ',
          style: TextStyle(
              fontSize: 14, fontFamily: 'NewYork', color: Colors.white),
        ),
        const Text(
          'bienvenido a ',
          style: TextStyle(
              fontSize: 13, fontFamily: 'Montserrat', color: Colors.white),
        ),
        Image.asset(
          "assets/images/logo_esperanza.png",
          height: 60,
          width: 150,
        ),
      ],
    );
  }

  Widget _coupons() {
    return Obx(() {
      return controller.defaultCoupon$.value.id != 0
          ? DottedBorder(
              color: Colors.white,
              strokeWidth: 1,
              dashPattern: const [5, 3],
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              radius: const Radius.circular(50),
              borderType: BorderType.RRect,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                GestureDetector(
                    // onTap: () => controller.toCouponDetail(),
                    onTap: () => controller.toCoupons(),
                    child: Text(
                        controller.defaultCoupon$.value.shortDescription,
                        style: const TextStyle(
                            fontSize: 13, color: Colors.white))),
                // const Spacer(),
                // GestureDetector(
                //     onTap: () {
                //       controller.toCoupons();
                //     },
                //     child: const Text(
                //       'Ver más',
                //       style: TextStyle(color: Colors.white, fontSize: 9),
                //     ))
              ]),
            ).paddingOnly(left: 35, right: 35, bottom: 10)
          : Container();
    });
  }

  Widget _flyerList() {
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
                borderRadius: BorderRadius.circular(5),
                child: GestureDetector(
                  onTap: () => controller.toFlyer(item),
                  child: FadeInImage(
                    width: 600,
                    fit: BoxFit.fill,
                    placeholder: const NetworkImage(
                        'https://acegif.com/wp-content/uploads/loading-11.gif'),
                    image: AssetImage(item.url),
                  ),
                ))));
  }

  _makePackage(product, BuildContext context) async {
    product.contains('Coca-Cola') && product.contains('Pollo Rostizado')
        ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
              children: [
                const Text('Deseas hacer un paquete?'),
                ElevatedButton(
                  child: Text('Si'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VariableProductsPage()));
                    // Get.toNamed(,
                    //     arguments: {'productsPackList': productsPackList$});
                  },
                ),
              ],
            ),
          ))
        : const SizedBox();
  }

  Widget _socials() {
    return SizedBox(
        width: double.infinity,
        child: Image.asset(
          'assets/home/rrss.png',
          fit: BoxFit.fill,
        )).paddingAll(10);
  }
}
