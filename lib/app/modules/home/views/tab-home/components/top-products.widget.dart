import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/circle_icon_button/circle_icon_button.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/components/cart-controls.widget.dart';
import 'package:jexpoints/app/modules/main/entities/product.type.dart';
import '../tab-home.controller.dart';

class HomeTopProducts extends GetView<HomeController> {
  const HomeTopProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 305,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _header(),
          const SizedBox(height: 10),
          _listWidget(context),
        ],
      ).paddingOnly(left: 10),
    );
  }

  Widget _header() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/top_semanal.png',
                height: 35,
                fit: BoxFit.cover,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('Top ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Montserrat-Regular',
                          fontSize: 30,
                          color: Colors.white)),
                  Text('Semanal',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'NewYork',
                          fontSize: 30,
                          color: Colors.white)),
                ],
              ),
              const SizedBox(height: 10),
            ],
          )),
    );
  }

  Widget _listWidget(BuildContext context) {
    return Obx(() {
      return Expanded(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.productList$.length,
            itemBuilder: (_, int index) {
              return _itemWidget(context, controller.productList$[index]);
            }),
      );
    });
  }

  Widget _itemWidget(BuildContext context, Product item) {
    double itemSize = 130;
    return Container(
      width: itemSize,
      height: itemSize,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => controller.toProductDetail(item),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(children: [
                  FadeInImage(
                    placeholder: const NetworkImage(
                        'https://acegif.com/wp-content/uploads/loading-11.gif'),
                    image: NetworkImage(item.imageLink),
                    width: double.infinity,
                    height: itemSize,
                    fit: BoxFit.cover,
                  ),
                ])),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(item.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontFamily: 'Montserrat-Regular')),
          Text(
            '\$ ${item.price}0' /*TODO: FORMAT EN HARDCODE: CAMBIAR*/,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 13,
                fontFamily: 'Montserrat-Bold',
                color: Colors.white),
          ),
          HomeCartControls(item)
        ],
      ),
    );
  }
}
