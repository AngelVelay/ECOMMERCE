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
      width: MediaQuery.of(context).size.width - 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildCreditCard(context,
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
Widget _buildCreditCard(BuildContext context,
    {required Color color,
    required String cardNumber,
    required String cardHolder,
    required String cardExpiration}) {
  return Container(
      height: 230,
      child: Stack(fit: StackFit.expand, children: [
        // Card(
        //   color: Colors.transparent,
        //   semanticContainer: true,
        //   clipBehavior: Clip.antiAliasWithSaveLayer,
        //   child: Image.asset(
        //     'assets/background_cards/silver.jpg',
        //     fit: BoxFit.fill,
        //   ),
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(20.0),
        //   ),
        //   elevation: 10,
        //   shadowColor: Colors.black87,

        //   margin: const EdgeInsets.all(20),
        // ),
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.asset(
            'assets/background_cards/silver.jpg',
            fit: BoxFit.cover,
          ),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.3),
                blurRadius: 3, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
                offset: const Offset(
                  5.0, // Move to right  horizontally
                  5.0, // Move to bottom Vertically
                ),
              )
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Container(
              height: 200,
              padding: const EdgeInsets.only(top: 22, left: 22.0, right: 22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildLogosBlock(),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Número',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontStyle: FontStyle.italic)),
                      const SizedBox(height: 3),
                      Text(
                        cardNumber,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'Montserrat-Medium',
                            letterSpacing: 1.8),
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
Widget _buildLogosBlock() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Image.asset(
        "assets/cards/card_title_platino.png",
        width: 270,
      ),
      const Text(
        'Programa de Recompensas',
        style: TextStyle(color: Colors.white, fontSize: 10),
      )
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
            color: Colors.white, fontSize: 10, fontStyle: FontStyle.italic),
      ),
      const SizedBox(height: 3),
      Text(
        value,
        style: const TextStyle(
            color: Colors.white, fontSize: 15, fontFamily: 'Montserrat-Bold'),
      )
    ],
  );
}

Widget _qrCode(BuildContext context) {
  return const ButtonQRScanner(
    height: 40,
    width: 40,
    title: '',
    color: Colors.white,
  );
}
