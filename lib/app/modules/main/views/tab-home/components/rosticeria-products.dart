import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:jexpoints/app/modules/main/views/tab-home/tab-home.controller.dart';

import 'cart-controls.widget.dart';

class RositceriaProducts extends GetView<HomeController> {
  const RositceriaProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 285,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(),
          const SizedBox(height: 10),
          _list(context),
        ],
      ),
    );
  }

  Widget _header() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              // Image.asset(
              //   'assets/images/top_semanal.png',
              //   height: 35,
              //   fit: BoxFit.cover,
              // ),
              Text('Rosticeria',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'NewYork',
                      fontSize: 30,
                      color: Colors.white)),
              SizedBox(height: 10),
            ],
          )),
    );
  }

  Widget _list(BuildContext context) {
    return Obx(() {
      return Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.variableProductsList$.length,
              itemBuilder: (_, int index) {
                return _item(context, controller.variableProductsList$[index]);
              }));
    });
  }

  Widget _item(BuildContext context, item) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              controller.toProductDetail(item);
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(children: [
                  FadeInImage(
                    placeholder: const NetworkImage(
                        'https://acegif.com/wp-content/uploads/loading-11.gif'),
                    image: AssetImage(item.url),
                    width: double.infinity,
                    height: 130,
                    fit: BoxFit.contain,
                  ),
                  // const Align(
                  //     alignment: Alignment.bottomRight,
                  //     child: Icon(Icons.add_circle_rounded,
                  //         color: Colors.white, size: 50)),
                ])),
          ),
          Text(item.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Montserrat-Bold')),
          Text(
            '\$ ${item.price}',
            maxLines: 1,
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
