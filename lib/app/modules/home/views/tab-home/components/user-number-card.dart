// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/tab-home.controller.dart';
import '../../../../../components/button-qr-generate/button-qr-generate.dart';

// ignore: camel_case_types
class userCardNumber extends GetView<HomeController> {
  const userCardNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          controller.isLoading$.value
              ? const CircularProgressIndicator()
              : _buildCreditCard(context, controller,
                  color: Color(0xFF000000),
                  cardExpiration: '12/22',
                  cardHolder: 'Angel Velay',
                  cardNumber: '5689 7854 4578 1234'),
        ],
      ),
    );
  }
}

// Build the credit card widget
Widget _buildCreditCard(BuildContext context, HomeController item,
    {required Color color,
    required String cardNumber,
    required String cardHolder,
    required String cardExpiration}) {
  return Container(
      height: 210,
      child: Stack(fit: StackFit.expand, children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: item.pointsLevel$.isEmpty
              ? const CircularProgressIndicator(
                  color: Colors.transparent,
                )
              : item.pointsLevel$.first.initialPoints! <= 100
                  ? Image.asset('assets/cards/card_title_platino.png',
                      fit: BoxFit.fill)
                  : item.pointsLevel$[1].initialPoints! <= 500
                      ? Image.asset('assets/background_cards/gold.jpg',
                          fit: BoxFit.fill)
                      : Image.asset('assets/background_cards/black.jpg',
                          fit: BoxFit.fill),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Container(
              height: 200,
              padding: const EdgeInsets.only(top: 33, left: 22.0, right: 22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildLogosBlock(item),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Número',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontStyle: FontStyle.italic)),
                      const SizedBox(height: 3),
                      Text(
                        cardNumber,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Montserrat-Bold',
                            letterSpacing: 1.6),
                      ),
                    ],
                  ),
                  const SizedBox(height: 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDetailsBlock(
                        label: 'Miembro',
                        value: cardHolder,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: _qrCode(context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ]));
}

// Build the top row containing logos
Widget _buildLogosBlock(controller) {
  return Expanded(
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          controller.pointsLevel$.isEmpty
              ? const CircularProgressIndicator(
                  color: Colors.transparent,
                )
              : controller.pointsLevel$.first.initialPoints! <= 100
                  ? Image.asset('assets/cards/card_title_platino.png')
                  : controller.pointsLevel$[1].initialPoints! <= 500
                      ? Image.asset('assets/cards/card_title_gold.png')
                      : Image.asset('assets/cards/card_title_black.png'),
          const Text(
            'Programa de Recompensas',
            style: TextStyle(color: Colors.white, fontSize: 8),
          )
        ],
      ),
    ),
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
            color: Colors.white, fontSize: 8, fontStyle: FontStyle.italic),
      ),
      const SizedBox(height: 3),
      Text(
        value,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'Montserrat-Medium',
            letterSpacing: 0),
      )
    ],
  );
}

Widget _qrCode(BuildContext context) {
  return Column(children: const [
    SizedBox(height: 5),
    ButtonQRScanner(
      height: 40,
      width: 40,
      title: '',
      color: Colors.white,
    )
  ]);
}


//  item.pointsLevel$.forEach((element) {
              
//               if (element.initialPoints! <= 100) {
//                 FadeInImage(
//                       placeholder: const AssetImage(
//                           'assets/cards/card_background_platino.png'),
//                       image: NetworkImage(
//                           '${item.pointsLevel$.last.cardBackgroundFile}'),
//                       fit: BoxFit.cover);
//               }else if (element.initialPoints! <= 200) {
//                 FadeInImage(
//                       placeholder: const AssetImage(
//                           'assets/cards/card_background_platino.png'),
//                       image: NetworkImage(
//                           '${item.pointsLevel$.last.cardBackgroundFile}'),
//                       fit: BoxFit.cover);
//             }else if (element.initialPoints! <= 300) {
//                 FadeInImage(
//                       placeholder: const AssetImage(
//                           'assets/cards/card_background_platino.png'),
//                       image: NetworkImage(
//                           '${item.pointsLevel$.last.cardBackgroundFile}'),
//                       fit: BoxFit.cover);
//          }})