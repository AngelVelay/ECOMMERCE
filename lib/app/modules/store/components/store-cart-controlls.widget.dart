import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/circle_icon_button/circle_icon_button.dart';
import 'package:jexpoints/app/modules/main/entities/product.type.dart';

import '../views/store-category-products/store-category-products.controller.dart';

class StoreCartControls extends GetView<StoreCategoryProductsController> {
  final Product item;
  final Color labelColor;
  final Color altColor;

  const StoreCartControls(
    this.item, {
    Key? key,
    this.labelColor = Colors.white,
    this.altColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      (item.cartValue > 0)
          ? CircleIconButton(
              backgroundColor: labelColor,
              iconData: Icons.remove,
              onPressed: () => controller.deleteCart(item),
              size: 15,
              foregroundColor: altColor,
            )
          : Container(),
      const Spacer(),
      (item.cartValue > 0)
          ? Text(
              '${item.cartValue}',
              style: TextStyle(color: labelColor, fontSize: 13),
            )
          : Container(),
      const Spacer(),
      CircleIconButton(
        backgroundColor: labelColor,
        iconData: Icons.add,
        onPressed: () {
          controller.addCart(item, context);
        },
        size: 15,
        foregroundColor: altColor,
      ),
    ]);
  }
}
