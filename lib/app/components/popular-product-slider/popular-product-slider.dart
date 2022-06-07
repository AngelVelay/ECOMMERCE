import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/circle_icon_button/circle_icon_button.dart';
import 'package:jexpoints/app/modules/main/entities/product.type.dart';
import 'package:jexpoints/app/modules/main/views/home/home.controller.dart';

class PopularProducts extends GetView<HomeController> {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text('Lo mas vendido',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.productList$.length,
                  itemBuilder: (_, int index) {
                    return itemWidget(context, controller.productList$[index]);
                  });
            }),
          ),
        ],
      ),
    );
  }

  Widget itemWidget(BuildContext context, Product item) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/detail', arguments: {
                'url': item.url,
                'name': item.name,
                'price': item.price,
              });
            },
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
                  //         color: Colors.white, size: 30)
                  // ),
                ])),
          ),
          const SizedBox(height: 3),
          Text(item.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black)),
          Text(
            '\$ ${item.price}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Row(children: [
            (item.cartValue > 0)
                ? CircleIconButton(
                    iconData: Icons.remove,
                    onPressed: () => controller.deleteCart(item),
                    size: 25,
                    foregroundColor: Colors.white,
                  )
                : Container(),
            const Spacer(),
            (item.cartValue > 0) ? Text('${item.cartValue}') : Container(),
            const Spacer(),
            CircleIconButton(
              iconData: Icons.add,
              onPressed: () => controller.addCart(item),
              size: 25,
              foregroundColor: Colors.white,
            ),
          ])
        ],
      ),
    );
  }
}
