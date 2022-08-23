import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../components/form-controls/custom-rounded-button.widget.dart';

import '../../../cart/components/apply-coupon.page.dart';
import '../../../home/views/tab-home/components/cart-controls.widget.dart';
import '../../../home/views/tab-home/tab-home.controller.dart';
import '../../../main/entities/product.type.dart';
import 'tab-shopping-cart.controller.dart';

class ShoppingCartPage extends StatelessWidget {
  ShoppingCartPage({Key? key}) : super(key: key);
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff2222222),
        title: const Text('Mi carrito').paddingSymmetric(horizontal: 10),
      ),
      body: Stack(
        children: [
          Column(children: [
            _cartProductList(
              context,
              controller,
            ),
            // _button()
          ]).paddingSymmetric(horizontal: 20),
          ApplyCoupon()
        ],
      ),
    ));
  }

  Widget _cartProductList(BuildContext context, controller) {
    return controller.cartProducts$.length > 0
        ? SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
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
            height: MediaQuery.of(context).size.height / 1.5,
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
                  style: TextStyle(fontSize: 20, color: Colors.grey),
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
                  borderRadius: BorderRadius.circular(0),
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
                    color: Colors.white),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '\$ ${item.price}',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${item.points} pts',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )),
            SizedBox(
                width: 80,
                child: HomeCartControls(
                  item,
                  labelColor: Colors.white,
                  altColor: Colors.black,
                ))
          ],
        ),
      ),
    );
  }

  Widget _button() {
    return controller.cartProducts$.isNotEmpty
        ? Container(
            width: double.infinity,
            child: CustomRoundedButton(
                    text: 'Continuar',
                    onPressed: () => controller.toSuggestions())
                .paddingSymmetric(horizontal: 20),
          )
        // Expanded(
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(
        //         horizontal: 20.0,
        //       ),
        //       child: SizedBox(
        //         width: double.infinity,
        //         height: 60,
        //         child: CustomRoundedButton(
        //             text: 'Pagar',
        //             onPressed: () => controller.toAddCreditCard()),
        //       ),
        //     ),
        //   )
        : Container();
    // ? Padding(
    //     padding: const EdgeInsets.only(
    //         top: 20.0, left: 20, right: 20, bottom: 20),
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
  }
}
