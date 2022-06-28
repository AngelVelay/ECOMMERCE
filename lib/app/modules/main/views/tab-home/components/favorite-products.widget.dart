import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/circle_icon_button/circle_icon_button.dart';
import 'package:jexpoints/app/modules/main/entities/product.type.dart';
import 'package:jexpoints/app/modules/main/views/tab-home/components/cart-controls.widget.dart';
import 'package:jexpoints/app/modules/main/views/tab-home/tab-home.controller.dart';

class HomeFavoriteProducts extends GetView<HomeController> {
  const HomeFavoriteProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
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
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text('Favoritos',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }

  Widget _list(BuildContext context) {
    return Obx(() {
      return Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.favoriteProducts$.length,
              itemBuilder: (_, int index) {
                return _item(context, controller.favoriteProducts$[index]);
              }));
    });
  }

  Widget _item(BuildContext context, Product item) {
    return Container(
      width: 200,
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => controller.toProductDetail(item),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(children: [
                  FadeInImage(
                    placeholder: const NetworkImage(
                        'https://tenor.com/view/loading-gif-9212724.gif'),
                    image: NetworkImage(item.url),
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
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
              style: const TextStyle(color: Colors.white, fontSize: 20)),
          Text(
            '\$ ${item.price}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          HomeCartControls(item)
        ],
      ),
    );
  }
}
