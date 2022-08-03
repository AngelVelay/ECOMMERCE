import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/circle_icon_button/circle_icon_button.dart';
import 'package:jexpoints/app/modules/main/entities/product.type.dart';
import '../../variable-products/variable-products.page.dart';
import '../tab-home.controller.dart';

class HomeCartControls extends GetView<HomeController> {
  final Product item;
  final Color labelColor;
  final Color altColor;

  const HomeCartControls(
    this.item, {
    Key? key,
    this.labelColor = Colors.white,
    this.altColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      (item.cartValue! > 0)
          ? CircleIconButton(
              backgroundColor: labelColor,
              iconData: Icons.remove,
              onPressed: () => controller.deleteCart(item),
              size: 15,
              foregroundColor: altColor,
            )
          : Container(),
      const Spacer(),
      (item.cartValue! > 0)
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
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //   content: Row(
          //     children: [
          //       const Text('Deseas hacer un paquete?'),
          //       SizedBox(width: 50),
          //       ElevatedButton(
          //         child: Text('Si'),
          //         onPressed: () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => VariableProductsPage()));
          //           // Get.toNamed(,
          //           //     arguments: {'productsPackList': productsPackList$});
          //         },
          //       ),
          //     ],
          //   ),
          // ));
        },
        size: 15,
        foregroundColor: altColor,
      ),
    ]);
  }
}
