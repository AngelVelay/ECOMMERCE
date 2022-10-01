import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/tab-home.controller.dart';

import '../../../components/custom_input/custom_input.dart';
import '../../../components/form-controls/custom-rounded-button.widget.dart';

class ApplyCoupon extends GetView<HomeController> {
  const ApplyCoupon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: controller.cartProducts$.isNotEmpty
          ? _dragrable(context, controller)
          : SizedBox(),
    );
  }
}

Widget _dragrable(context, controller) {
  return DraggableScrollableSheet(
    snap: true,
    initialChildSize: 0.15,
    minChildSize: 0.15,
    maxChildSize: 0.6,
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
                _applyCoupon(context),
                _buttonConfirm(context, controller),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _totalBuy(context, controller) {
  return Obx(
    () {
      return Column(
        children: [
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: Divider(
              color: Colors.white,
              thickness: 3,
            ),
          ),
          ListTile(
            title: Text(
              'Total',
              style: Theme.of(context).textTheme.headline4,
            ),
            trailing: Text(
              '\$ ${controller.subtotalBuy$.value.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          ListTile(
            title: Text(
              'Descuento',
              style: Theme.of(context).textTheme.headline4,
            ),
            trailing: Text(
              ' - \$ ${controller.defaultCoupon$.value.amount}',
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
          ListTile(
            title: Text(
              'Pagar',
              style: Theme.of(context).textTheme.headline4,
            ),
            trailing: Text(
              '\$ ${controller.totalBuy()}',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ],
      );
    },
  );
}

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

Widget _buttonConfirm(context, controller) {
  return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: CustomRoundedButton(
          text: 'Continuar',
          onPressed: () {
            controller.toSuggestions();
          },
          // child: ElevatedButton.icon(
          //   style: ButtonStyle(
          //       backgroundColor: MaterialStateProperty.all<Color>(
          //         const Color(0xFF43578d),
          //       ),
          //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //           RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(18.0),
          //               side: const BorderSide(color: Colors.black)))),
          //   icon: const Icon(
          //     Icons.monetization_on,
          //     size: 20,
          //   ),
          //   onPressed: () {
          //     controller.toCheckout();
          //   },
          //   label: const Text('Pagar',
          //       style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 20,
          //           color: Colors.white)),
          // ),
        ),
      ));
}
