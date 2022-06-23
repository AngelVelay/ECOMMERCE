import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/entities/credit-card.dart';
import 'package:string_to_hex/string_to_hex.dart';

import '../tab-home/tab-home.page.dart';
import 'addCreditCard.controller.dart';

class addCreditCard extends GetView<AddCardController> {
  // @override
  // final AddCardController controller;

  // const addCreditCard(this.controller, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff2222222),
      child: SafeArea(
        left: false,
        right: false,
        bottom: true,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff2222222),
              title: Text('Selecciona un metodo de Pago'),
            ),
            body: Column(
              children: [
                Expanded(child: _chooseCreditCard(context)),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      _anotherPayWay(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buttonConfirm(context),
                          _addCreditCard(),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget _chooseCreditCard(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.only(
                top: 20.0, left: 8.0, right: 8.0, bottom: 20),
            child: Obx((() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: controller.creditCardList$.map((item) {
                  return _creditCard(item, context);
                }).toList(),
              );
            }))));
  }

  Widget _creditCard(CreditCard item, BuildContext context) {
    return Row(
      children: [
        Radio<CreditCard>(
          value: item,
          groupValue: controller.selectedCreditCard.value,
          onChanged: (value) {
            controller.creditCardSelect(value as CreditCard, context);
          },
        ),
        SizedBox(
          width: 5,
        ),
        _buildCreditCard(
          // color: Color(StringToHex.toColor('${item.color}')),
          color: Color(0xFF43578d),
          cardExpiration: item.cardExpiration,
          cardHolder: item.cardHolder,
          cardNumber: item.cardNumber,
        ),
      ],
    );
  }
}

Card _buildCreditCard(
    {required Color color,
    required cardNumber,
    required cardHolder,
    required cardExpiration}) {
  return Card(
    elevation: 4.0,
    color: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
    ),
    child: Container(
      height: 180,
      padding: const EdgeInsets.only(left: 16.0, right: 80.0, bottom: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildLogosBlock(),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              '$cardNumber',
              style: TextStyle(
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
                value: cardHolder,
              ),
              SizedBox(
                width: 50,
              ),
              _buildDetailsBlock(
                  label: 'Fecha de Expiración', value: cardExpiration),
            ],
          ),
        ],
      ),
    ),
  );
}

// Build the top row containing logos
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
        "assets/images/mastercard.png",
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
        style: TextStyle(
            color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
      ),
      Text(
        value,
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      )
    ],
  );
}

Column _anotherPayWay() {
  return Column(
    children: [
      Text(
        'Tambien puedes pagar con :',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              width: 80,
              height: 80,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {},
                child: FadeInImage(
                  image: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Apple_Pay_logo.svg/1200px-Apple_Pay_logo.svg.png'),
                  placeholder: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Apple_Pay_logo.svg/1200px-Apple_Pay_logo.svg.png'),
                  width: 80,
                  height: 80,
                ),
              )),
          Container(
              width: 80,
              height: 80,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {},
                child: FadeInImage(
                  image: NetworkImage(
                      'https://s3.cointelegraph.com/storage/uploads/view/3278bdc14c74dd4e85732b776d0e5b1d.png'),
                  placeholder: AssetImage('assets/images/face-id.png'),
                  width: 80,
                  height: 80,
                ),
              )),
        ],
      ),
    ],
  );
}

Widget _buttonConfirm(context) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton.icon(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Color(0xFF43578d),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black)))),
        icon: const Icon(
          Icons.monetization_on,
          size: 20,
        ),
        onPressed: () {
          Get.toNamed('/confirm-compra');
        },
        label: const Text(' Confirmar Compra',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white)),
      ),
    ),
  );
}

Row _addCreditCard() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      GestureDetector(
        onTap: () {
          Get.toNamed("/pay");
        },
        child: Container(
          child: const Text(
            'Agregar una tarjeta',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      const SizedBox(width: 10),
      const Icon(
        Icons.arrow_forward_ios_sharp,
        color: Colors.white,
      ),
    ],
  );
}



 // return ListView.builder(
              //   itemBuilder: (context, index) {
              //     return Row(
              //       children: [
              //         Radio<CreditCard>(
              //           value: controller.creditCardList$[index],
              //           groupValue: controller.creditCardList$[index],
              //           onChanged: (value) {
              //             controller.selectedCreditCard(value as CreditCard);
              //           },
              //         ),
              //         SizedBox(
              //           width: 5,
              //         ),
              //         _buildCreditCard(
              //             color: Color(StringToHex.toColor(
              //                 '${controller.creditCardList$[index].color}')),
              //             cardExpiration:
              //                 "${controller.creditCardList$[index].cardExpiration}",
              //             cardHolder:
              //                 "${controller.creditCardList$[index].cardHolder}",
              //             cardNumber:
              //                 "${controller.creditCardList$[index].cardNumber}"),
              //       ],
              //     );
              //   },
              //   itemCount: controller.creditCardList$.length,
              //   shrinkWrap: true,
              //   physics: ClampingScrollPhysics(),
              // );