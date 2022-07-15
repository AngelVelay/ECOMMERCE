import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/circle_icon_button/circle_icon_button.dart';
import 'package:jexpoints/app/modules/main/entities/product.type.dart';
import 'package:jexpoints/app/modules/main/views/tab-home/components/cart-controls.widget.dart';
import '../tab-home.controller.dart';

class HomeTopProducts extends GetView<HomeController> {
  const HomeTopProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
<<<<<<< Updated upstream
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text('Top Semanal',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
=======
          _header(),
>>>>>>> Stashed changes
          const SizedBox(height: 10),
          _listWidget(context),
        ],
      ),
    );
  }

  Widget _header() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/top_semanal.png',
                height: 35,
                fit: BoxFit.cover,
              ),
              const Text('Top Semanal',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'NewYork',
                      fontSize: 30,
                      color: Colors.white)),
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
    return Container(
      width: 150,
      height: 150,
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
                    image: NetworkImage(item.url),
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ])),
          ),
          Text(item.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Montserrat-Bold')),
          Text(
            '\$ ${item.price}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 15,
                fontFamily: 'Montserrat-Bold',
                color: Colors.white),
          ),
          HomeCartControls(item)
        ],
      ),
    );
  }
}
