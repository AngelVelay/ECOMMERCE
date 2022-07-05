import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:jexpoints/app/modules/main/views/tab-home/tab-home.controller.dart';
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

// Build the title section
Column _buildTitleSection({@required title, @required subTitle}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 16.0),
        child: Text(
          '$title',
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
        child: Text(
          '$subTitle',
          style: TextStyle(fontSize: 21, color: Colors.white),
        ),
      )
    ],
  );
}

// Build the credit card widget
Widget _buildCreditCard(BuildContext context,
    {required Color color,
    required String cardNumber,
    required String cardHolder,
    required String cardExpiration}) {
  return Card(
    elevation: 4.0,
    color: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
    ),
    child: Container(
      height: 200,
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildLogosBlock(),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Número',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cardNumber,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDetailsBlock(
                label: 'Nombre',
                value: cardHolder,
              ),
              _qrCode(context),
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
        "assets/images/logo_esperanza.png",
        height: 60,
        width: 150,
      ),
      // Image.asset(
      //   "assets/images/splash.gif",
      //   height: 60,
      //   width: 80,
      // ),
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
            color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold),
      ),
      Text(
        value,
        style: const TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      )
    ],
  );
}

Widget _qrCode(BuildContext context) {
  return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
    ButtonQRScanner(
      height: 50,
      width: 50,
      title: '',
      color: Colors.white,
    )
  ]));
}
