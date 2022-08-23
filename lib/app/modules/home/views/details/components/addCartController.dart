import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/circle_icon_button/circle_icon_button.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/tab-home.controller.dart';
import 'package:jexpoints/app/modules/main/entities/product.type.dart';

// ignore: camel_case_types
class AddCartControls extends GetView<HomeController> {
  final Product item;
  final Color labelColor;
  final Color altColor;

  const AddCartControls(
    this.item, {
    Key? key,
    this.labelColor = Colors.white,
    this.altColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0),
      child: Row(children: [
        (item.cartValue! > 0)
            ? CircleIconButton(
                backgroundColor: labelColor,
                iconData: Icons.remove,
                onPressed: () => controller.deleteCart(item),
                size: 30,
                foregroundColor: altColor,
              )
            : Container(),
        const Spacer(),
        (item.cartValue! > 0)
            ? Text(
                '${item.cartValue}',
                style: TextStyle(
                    color: labelColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            : Container(),
        const Spacer(),
        CircleIconButton(
          backgroundColor: labelColor,
          iconData: Icons.add,
          onPressed: () {
            controller.addCart(item, context);
          },
          size: 30,
          foregroundColor: altColor,
        ),
      ]),
    );
  }
}
