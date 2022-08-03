import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/core/utils/sheet.utils.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/components/cart-controls.widget.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/tab-home.controller.dart';
import 'package:jexpoints/app/modules/main/entities/product.type.dart';

import '../../../../../components/form-controls/custom-rounded-button.widget.dart';
import '../../../../../components/points/points.widget.dart';

class HomeShoppingCart extends GetView<HomeController> {
  HomeShoppingCart({Key? key}) : super(key: key);

  late double size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        SheetUtils.show(context, _cartSheetContent(context),
            title: "Mi Carrito", height: size);
      },
      child: _cartIconButton(),
    );
  }

  Widget _cartIconButton() {
    return Stack(children: [
      const Icon(
        Icons.shopping_cart,
        color: Colors.white,
        size: 40,
      ),
      Obx(() {
        return PointsViewer(
            size: 23, value: '${controller.cartItems$}', fontSize: 11);
      })
    ]);
  }

  Widget _cartSheetContent(BuildContext context) {
    return Column(
      children: [
        _cartProductList(context),
        _button(),
      ],
    );
  }

  Widget _cartProductList(BuildContext context) {
    return controller.cartProducts$.isNotEmpty
        ? SizedBox(
            height: size - 162,
            child: Obx(() {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.cartProducts$.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _cartProductListItem(
                        controller.cartProducts$[index]);
                  });
            }))
        : SizedBox(
            height: size - 162,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.remove_shopping_cart_outlined,
                  color: Colors.grey,
                  size: 100,
                ),
                Text(
                  "No hay productos en el carrito",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          );
  }

  Widget _cartProductListItem(Product item) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                    placeholder: const NetworkImage(
                        'https://acegif.com/wp-content/uploads/loading-11.gif'),
                    image: NetworkImage(item.imageLink),
                  )),
            ),
            Expanded(
                child: ListTile(
              title: Text(
                item.name,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '\$ ${item.price}',
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${item.points} pts',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )),
            SizedBox(
                width: 80,
                child: HomeCartControls(
                  item,
                  labelColor: Colors.black,
                  altColor: Colors.white,
                ))
          ],
        ),
      ),
    );
  }

  Widget _button() {
    return controller.cartProducts$.isNotEmpty
        ? SizedBox(
            child: CustomRoundedButton(
                text: 'Pagar', onPressed: () => controller.toAddCreditCard()),
          )
        // ? Padding(
        //     padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
        //     child: SizedBox(
        //       height: 60,
        //       width: double.infinity,
        //       child: ElevatedButton.icon(
        //         style: ButtonStyle(
        //             backgroundColor: MaterialStateProperty.all<Color>(
        //               const Color(0xFF43578d),
        //             ),
        //             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //                 RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(18.0),
        //                     side: const BorderSide(color: Colors.black)))),
        //         icon: const Icon(
        //           Icons.monetization_on,
        //           size: 20,
        //         ),
        //         onPressed: controller.cartProducts$.length > 0
        //             ? () => controller.toAddCreditCard()
        //             : null,
        //         label: const Text('Pagar',
        //             style: TextStyle(
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 20,
        //                 color: Colors.white)),
        //       ),
        //     ),
        //   )
        : Container();
  }
}
