import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/entities/flyer.type.dart';
import 'package:jexpoints/app/modules/main/views/tab-home/components/header.widget.dart';
import 'components/favorite-products.widget.dart';
import 'components/top-products.widget.dart';
import 'tab-home.controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff222222),
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: const Color(0xff222222),
          body: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: HomeHeader(
                  controller,
                  expandedHeight: 170,
                ),
              ),
              SliverToBoxAdapter(
                child: Column(children: [
                  const SizedBox(height: 15),

                  // _coupons(),
                  _flyerList(),
                  const HomeTopProducts(),
                  const SizedBox(height: 15),
                  const HomeFavoriteProducts(),
                  const SizedBox(height: 20),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _coupons() {
    return Obx(() {
      return controller.defaultCoupon$.value.id != 0
          ? Container(
              width: double.infinity,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: const Color(0xFFc59400), width: 3),
                // color: Colors.black
              ),
              child: Row(children: [
                GestureDetector(
                    onTap: () => controller.toCouponDetail(),
                    child: Text(
                        controller.defaultCoupon$.value.shortDescription,
                        style: const TextStyle(color: Colors.white))),
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      controller.toCoupons();
                    },
                    child: const Text(
                      'Ver mas',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ))
              ]),
            ).paddingOnly(left: 15, right: 15, bottom: 10)
          : Container();
    });
  }

  Widget _flyerList() {
    return SizedBox(
        child: ListView(
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
    ));
  }

  Widget _flyerItem(Flyer item) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
            width: 600,
            height: 600,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: GestureDetector(
                  onTap: () => controller.toFlyer(item),
                  child: FadeInImage(
                    width: 600,
                    height: 3000,
                    fit: BoxFit.fill,
                    placeholder: const NetworkImage(
                        'https://tenor.com/view/loading-gif-9212724.gif'),
                    image: NetworkImage(item.url),
                  ),
                ))));
  }
}
