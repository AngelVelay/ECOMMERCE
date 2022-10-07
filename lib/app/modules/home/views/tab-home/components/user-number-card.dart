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
    return SizedBox(
        width: 330,
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              controller.isLoading$.value
                  ? const SizedBox()
                  : _buildCreditCard(context,
                      cardHolder: controller.user$.value.name,
                      cardNumber: controller.user$.value.formattedCardNumber),
            ],
          );
        }));
  }

  Widget _buildCreditCard(BuildContext context,
      {required String cardNumber, required String cardHolder}) {
    return SizedBox(
        height: 220,
        child: Stack(fit: StackFit.expand, children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(
                image: NetworkImage(
                    controller.user$.value.level?.cardBackgroundFile ?? ''),
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
                height: 190,
                padding:
                    const EdgeInsets.only(top: 33, left: 22.0, right: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildLogosBlock(controller),
                    // const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Número',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontStyle: FontStyle.italic)),
                        const SizedBox(height: 2),
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
  Widget _buildLogosBlock(HomeController controller) {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
                height: 25,
                image: NetworkImage(
                    controller.user$.value.level?.cardHeaderFile ?? '')),
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
}
