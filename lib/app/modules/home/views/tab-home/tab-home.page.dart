import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/home/components/draggable-button-pickup.dart';
import 'package:jexpoints/app/modules/home/components/draggable-button.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/components/favorite-products.widget.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/components/header.widget.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/tab-home.controller.dart';
import 'package:jexpoints/app/modules/main/views/variable-products/variable-products.page.dart';

import '../../entities/posters.type.dart';
import 'components/top-products.widget.dart';

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
              SliverToBoxAdapter(child: Obx((() {
                return controller.isLoading$.value
                    ? const Center(child: CircularProgressIndicator())
                    : Column(children: [
                        _welcomeGreeting(),
                        _coupons(),
                        const SizedBox(height: 20),
                        _postersList(),
                        const SizedBox(height: 20),
                        const HomeTopProducts(),
                        const SizedBox(height: 20),
                        // const HomeFavoriteProducts(),
                        // const SizedBox(height: 20),
                        _socials()                        
                      ]);
              })))
            ],
          ),
          floatingActionButton: controller.showDeliveryisVisible$.value == true
              ? controller.showDeliveryButton$.isFalse
                  ? const DraggableButton()
                  : const DraggableButtonPickup()
              : const SizedBox(),
          // floatingActionButton: controller.showDeliveryType$.isFalse
          //     ? const DraggableButton()
          //     : const DraggableButtonPickup(),

          // floatingActionButton: DraggableButtonPickup(),
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop),
    );
  }

  Widget _welcomeGreeting() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '??Hola! ',
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
          ? GestureDetector(
              onTap: () => controller.toCoupons(),
              child: DottedBorder(
                  color: Colors.white,
                  strokeWidth: 1,
                  dashPattern: const [5, 3],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  radius: const Radius.circular(50),
                  borderType: BorderType.RRect,
                  child: Text(controller.defaultCoupon$.value.title,
                      style:
                          const TextStyle(fontSize: 13, color: Colors.white))),
            ).paddingSymmetric(horizontal: 35, vertical: 10)
          : Container();
    });
  }

  Widget _postersList() {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Obx(() {
          return CarouselSlider.builder(
            itemCount: controller.posterList$
                .where((p0) => p0.isActive == true)
                .length,
            itemBuilder: (context, index, realIndex) {
              return controller.posterList$.isNotEmpty
                  ? _posterItem(controller.posterList$[index])
                  : Container();
            },
            options: CarouselOptions(
              height: 150,
              autoPlay: controller.posterList$
                          .where((p0) => p0.isActive == true)
                          .length <=
                      1
                  ? true
                  : false,
              scrollDirection: Axis.horizontal,
            ),
          );
        })
      ],
    );
  }

  Widget _posterItem(Posters item) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: SizedBox(
            width: 600,
            height: 600,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: GestureDetector(
                  onTap: () => controller.toFlyer(item),
                  child: item.isActive == true
                      ? Image.network(
                          item.appFileManagerThumbnail,
                          fit: BoxFit.cover,
                          width: 600,
                        )
                      : Container(),
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
