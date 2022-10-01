import 'package:awesome_card/awesome_card.dart';
import 'package:awesome_card/credit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:jexpoints/app/components/button/custom_button_transparent.dart';
import 'package:jexpoints/app/components/custom_input/custom_input.dart';

import 'pay.controller.dart';

class PayPage extends GetView<PayController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: false,
      right: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            controller.card$.value.id == 0 ? 'Agregar ' : 'Datos de tarjeta',
            style: TextStyle(
                color: Colors.white, fontSize: 13.sp, fontFamily: 'Montserrat'),
          ),
        ),
        // body: ,
        body: SingleChildScrollView(
          child: Obx((() {
            return Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _title('METODO DE PAGO', Icons.credit_card),
                  const SizedBox(height: 10),
                  // _creditCard(context),
                  _buildCreditCard(),
                  const SizedBox(
                    height: 20,
                  ),
                  _formCreditCard(context),
                ],
              ),
            );
          })),
        ),
      ),
    );
  }

  Widget _title(title, icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
      child: Center(
        child: Column(
          children: [
            Text(title,
                style: TextStyle(
                  fontSize: 17.sp,
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 20),
            Icon(icon, color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _creditCard(context) {
    return CreditCard(
        cardNumber: controller.cardNumber$.value,
        cardExpiry: controller.cardExpiration$.value,
        cardHolderName: controller.cardHolder$.value,
        cvv: controller.cardCVV$.value,
        bankName: controller.cardNumber$.value.contains('4')
            ? 'VISA'
            : controller.cardNumber$.value.contains('5')
                ? 'MASTERCARD'
                : controller.cardNumber$.value.contains('37')
                    ? 'AMEX'
                    : '',
        cardType: controller.cardNumber$.value.contains('4')
            ? CardType.visa
            : controller.cardNumber$.value.contains('5')
                ? CardType.masterCard
                : controller.cardNumber$.value.contains('37')
                    ? CardType.americanExpress
                    : CardType.other,
        // Optional if you want to override Card Type
        // showBackSide: controller.cardCVV$.value.isNotEmpty ? true : false,
        showBackSide: false,
        frontBackground: CardBackgrounds.black,
        backBackground: CardBackgrounds.white,
        showShadow: true,
        textExpDate: 'Vencimiento',
        textName: 'Nombre',
        textExpiry: 'MM/YY');
  }

// Build the credit card widget
  Card _buildCreditCard() {
    return Card(
      elevation: 4.0,
      color: const Color(0xFF000000),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: 200,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildLogosBlock(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                controller.cardNumber$.value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildDetailsBlock(
                  label: 'Nombre',
                  value: controller.cardHolder$.value,
                ),
                _buildDetailsBlock(
                    label: 'Numero de Expiración',
                    value: controller.cardExpiration$.value)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _buildLogosBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(
          "assets/images/contact_less.png",
          height: 20,
          width: 18,
        ),
        Image.asset(
          controller.cardNumber$.value.startsWith('4')
              ? 'assets/images/visa.png'
              : controller.cardNumber$.value.startsWith('5')
                  ? 'assets/images/mastercard.png'
                  : controller.cardNumber$.value.startsWith('37')
                      ? 'assets/images/amex.png'
                      : 'assets/images/credit-card.png',
          height: 50,
          width: 50,
        ),
      ],
    );
  }

// Build Column containing the cardholder and expiration information
  Column _buildDetailsBlock({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget _formCreditCard(BuildContext context) {
    return Container(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              CustomInputField(
                inputFormatter:
                    FilteringTextInputFormatter.allow(RegExp(r'[A-Z,a-z," "]')),
                controller: controller.cardHolder,
                keyboardType: TextInputType.text,
                labelText: 'Titular',
                prefixIcon: Icons.person_outline_outlined,
              ),
              CustomInputField(
                inputFormatter: controller.cardNUmberFormatter,
                controller: controller.cardNumber,
                keyboardType: TextInputType.number,
                labelText: 'Numero de tarjeta',
                prefixIcon: Icons.credit_card,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomInputField(
                      inputFormatter: controller.cardExpirationFormatter,
                      controller: controller.cardExpiration,
                      keyboardType: TextInputType.datetime,
                      labelText: 'Vencimiento',
                      prefixIcon: Icons.date_range,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: CustomInputField(
                      inputFormatter: controller.cardCVVFormatter,
                      controller: controller.cardCVV,
                      keyboardType: TextInputType.number,
                      labelText: 'CVV',
                      prefixIcon: Icons.credit_score_rounded,
                    ),
                  )
                ],
              ),
              ButtonTransparent(
                text: 'Agregar Tarjeta',
                paddingHorizontal: 20,
                paddingVertical: 30,
                onPressed: () {
                  controller.save(context);
                  Get.snackbar(
                    'Tarjeta Agregada',
                    'Nuevo metodo de pago agregado',
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.black.withOpacity(0.5),
                    duration: Duration(seconds: 2),
                  );
                },
              )
            ])));

    //       Padding(
    //         padding: const EdgeInsets.symmetric(vertical: 50.0),
    //         child: SizedBox(
    //           height: 50,
    //           width: MediaQuery.of(context).size.width,
    //           child: ElevatedButton.icon(
    //             style: ButtonStyle(
    //                 backgroundColor: MaterialStateProperty.all<Color>(
    //                   Color(0xFF43578d),
    //                 ),
    //                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //                     RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(18.0),
    //                         side: BorderSide(color: Colors.black)))),
    //             icon: const Icon(
    //               Icons.monetization_on,
    //               size: 20,
    //             ),
    //             onPressed: () => controller.save(context),
    //             label: Text(
    //                 controller.card$.value.id == 0
    //                     ? 'Agregar Tarjeta'
    //                     : 'Guardar datos',
    //                 style: const TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 20,
    //                     color: Colors.white)),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // ),

// class LogoCreditCard extends StatelessWidget {
//   LogoCreditCard({Key? key}) : super(key: key);
//   final controller = Get.find<PayController>();

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<PayController>(
//         init: controller.creditCardLogo(),
//         builder: (_) => Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Image.asset(
//                     "assets/images/contact_less.png",
//                     height: 20,
//                     width: 18,
//                   ),
//                 ]));
//   }
// }
  }
}
