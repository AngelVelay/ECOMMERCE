import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jexpoints/app/modules/main/views/confirm_compra/confirm-compra.controller.dart';
import 'package:jexpoints/app/modules/main/views/main/main.page.dart';

import '../../../../components/custom_input/custom_input.dart';
import '../../entities/product.type.dart';

import '../tab-home/components/cart-controls.widget.dart';
import '../tab-home/tab-home.controller.dart';
import '../tab-home/tab-home.page.dart';
import 'components/suggestions.page.dart';

class ConfirmPagoPage extends GetView<HomeController> {
  const ConfirmPagoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Confirmar Compra'),
            backgroundColor: Color(0xff222222),
          ),
          body: Stack(
            children: [
              Text(''),
              Column(
                children: [
                  Expanded(child: _cartProductList(context)),
                  Expanded(child: SuggestionsProducts()),
                ],
              ),

              _dragrable(context)
              // Expanded(
              //   child: Column(
              //     children: [

              //       // _applyCoupon(context),
              //       // _totalBuy(context, controller),
              //       // // PopularProducts('Sugerencias de Compra'),
              //       // _buttonConfirm(context)
              //     ],
              //   ),
              // )
            ],
          ),
        ));
  }

  Widget _cartProductList(BuildContext context) {
    final size = MediaQuery.of(context).size.height * 0.85;

    return Container(
        height: size - 350,
        child: Obx(() {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: controller.cartProducts$.length,
              itemBuilder: (BuildContext context, int index) {
                return _cartProductListItem(
                    controller.cartProducts$[index], context);
              });
        }));
  }

  Widget _cartProductListItem(Product item, context) {
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
                        'https://tenor.com/view/loading-gif-9212724.gif'),
                    image: NetworkImage(item.url),
                  )),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  item.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '\$ ${item.price}',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${item.points} pts',
                      style: Theme.of(context).textTheme.headline5,
                    )
                  ],
                ),
              ),
            ),
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

  Widget _totalBuy(context, controller) {
    return Obx(
      () {
        return Column(
          children: [
            ListTile(
              title: Text(
                'Subtotal',
                style: Theme.of(context).textTheme.headline4,
              ),
              trailing: Text(
                '\$ ${controller.subtotalBuy()}',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            ListTile(
              title: Text(
                'Cupón de Descuento',
                style: Theme.of(context).textTheme.headline4,
              ),
              trailing: Text(
                ' - \$ ${controller.defaultCoupon$.value.amount}',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
            ListTile(
              title: Text(
                'Total a pagar',
                style: Theme.of(context).textTheme.headline4,
              ),
              trailing: Text(
                '\$ ${controller.totalBuy()}',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       'Subtotal',
            //       style: Theme.of(context).textTheme.headline4,
            //     ),
            //     Text(
            //       '\$480',
            //       style: Theme.of(context).textTheme.headline4,
            //     )
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Text(
            //       'Envio',
            //       style: TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.normal,
            //           color: Colors.black),
            //     ),
            //     Text(
            //       '\$50',
            //       style: TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.black),
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Text(
            //       'Cupon de Descuento',
            //       style: TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.normal,
            //           color: Colors.black),
            //     ),
            //     Text(
            //       ' - \$50',
            //       style: TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.red),
            //     ),
            //   ],
            // ),
            // Divider(
            //   color: Colors.black,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Text(
            //       'Total a Pagar',
            //       style: TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.black),
            //     ),
            //     Text(
            //       '\$480',
            //       style: TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.black),
            //     ),
            //   ],
            // ),
          ],
        );
      },
    );
  }

  // Widget _confirmarCompra(context,ConfirmPagoController controller) {
  //   return ListView.builder(
  //       scrollDirection: Axis.vertical,
  //       shrinkWrap: true,
  //       itemCount: controller.cartProducts$.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return SingleChildScrollView(
  //           child: Container(
  //             margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //             child: GestureDetector(
  //               onTap: () {},
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: [
  //                   Container(
  //                     height: 80,
  //                     child: ClipRRect(
  //                         borderRadius: BorderRadius.circular(20),
  //                         child: FadeInImage(
  //                           placeholder: const NetworkImage(
  //                               'https://tenor.com/view/loading-gif-9212724.gif'),
  //                           image: NetworkImage(cartProducts$.),
  //                               // productsList[index]['url'].toString()),
  //                         )),
  //                   ),
  //                   Expanded(
  //                       child: ListTile(
  //                     title: Text(
  //                       '${productsList[index]['title']}',
  //                       style: const TextStyle(
  //                         fontSize: 20,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     subtitle: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Text(
  //                           '\$ ${productsList[index]['precio']}',
  //                           style: const TextStyle(
  //                             fontSize: 15,
  //                           ),
  //                         ),
  //                         Text(
  //                           '${productsList[index]['puntos']} pts',
  //                           style: const TextStyle(
  //                               fontSize: 15, fontWeight: FontWeight.bold),
  //                         ),
  //                         Row(
  //                           children: const [
  //                             Icon(Icons.remove_circle_outline_outlined,
  //                                 size: 25, color: Colors.black),
  //                             Text('1', style: TextStyle(fontSize: 25)),
  //                             Icon(Icons.add_circle_outline_outlined,
  //                                 size: 25, color: Colors.black),
  //                           ],
  //                         )
  //                       ],
  //                     ),
  //                   ))
  //                 ],
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  // }

  Widget _applyCoupon(context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          const Expanded(
            child: CustomInputField(
              keyboardType: TextInputType.datetime,
              labelText: 'Código de Cupón',
              prefixIcon: Icons.card_giftcard,
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed('/apply-coupon');
            },
            // child: Expanded(
            child: Container(
              height: 60,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xFF43578d),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: const Text(
                'Aplicar',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // ),
        ],
      ),
    );
  }

  Widget _buttonConfirm(context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton.icon(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color(0xFF43578d),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.black)))),
          icon: const Icon(
            Icons.monetization_on,
            size: 20,
          ),
          onPressed: () {
            controller.toCheckout();
          },
          label: const Text('Pagar',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white)),
        ),
      ),
    );
  }

  Widget _gifConfirm() {
    return Center(
        child: AnimatedSplashScreen(
            splashIconSize: 500,
            duration: 3000,
            splash: Container(
              height: 600,
              child: Column(
                children: const [
                  Expanded(
                    child: FadeInImage(
                        height: 600,
                        width: 600,
                        fit: BoxFit.cover,
                        placeholder: AssetImage('assets/images/delivery.gif'),
                        image: AssetImage('assets/images/delivery.gif')),
                  ),
                  Text('Tu pedido esta en camino...',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            nextScreen: controller.toHome(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: const Color(0xFFffffff)));
  }

  Widget _dragrable(context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.1,
      minChildSize: 0.1,
      maxChildSize: 0.4,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: const Color(0xFF2d3447)),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  // _applyCoupon(context),
                  _totalBuy(context, controller),
                  _buttonConfirm(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
