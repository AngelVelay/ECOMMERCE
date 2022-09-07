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
          child: item.pointsLevel$.isNotEmpty
              ? item.pointsLevel$.first.initialPoints! >= 100
                  ? FadeInImage(
                      placeholder: const AssetImage(
                          'assets/cards/card_background_platino.png'),
                      image: NetworkImage(
                          '${item.pointsLevel$.last.cardBackgroundFile}'),
                      fit: BoxFit.cover,
                    )
                  : FadeInImage(
                      placeholder: const AssetImage(
                          'assets/cards/card_background_platino.png'),
                      image: NetworkImage(
                          '${item.pointsLevel$.first.cardBackgroundFile}'),
                      fit: BoxFit.cover,
                    )
              : const SizedBox(),
          // child: Image.network(
          //   // ignore: unnecessary_string_interpolations
          //   '${item.pointsLevel$.first.cardBackgroundFile ?? ''}',
          //   fit: BoxFit.cover,
          // ),
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
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      controller.pointsLevel$.isNotEmpty
          ? controller.pointsLevel$.first.initialPoints! >= 100
              ? Image.network(
                  // ignore: unnecessary_string_interpolations
                  '${controller.pointsLevel$.last.cardHeaderFile}',
                  height: 23,
                )
              : Image.network(
                  // ignore: unnecessary_string_interpolations
                  '${controller.pointsLevel$.first.cardHeaderFile}',
                  height: 23,
                )
          : const SizedBox(),

      // controller.pointsLevel$.first.initialPoints! >= 100
      //     ? FadeInImage(
      //         placeholder: AssetImage('assets/cards/card_title_platino.png'),
      //         image: NetworkImage(
      //             '${controller.pointsLevel$.last.cardHeaderFile}'),
      //         fit: BoxFit.cover,
      //         height: 23,
      //       )
      //     : FadeInImage(
      //         placeholder:
      //             const AssetImage('assets/cards/card_background_platino.png'),
      //         image: NetworkImage(
      //             '${controller.pointsLevel$.first.cardHeaderFile}'),
      //         fit: BoxFit.cover,
      //         height: 23,

      // FadeInImage(
      //   placeholder: AssetImage('assets/cards/card_title_platino.png'),
      //   image: NetworkImage('${controller.pointsLevel$.first.cardHeaderFile}'),
      //   fit: BoxFit.cover,
      //   height: 23,
      // ),
      // Image.network(
      //   '${controller.pointsLevel$.first.cardHeaderFile}',
      //   height: 23,
      // ),
      const Text(
        'Programa de Recompensas',
        style: TextStyle(color: Colors.white, fontSize: 8),
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
