import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jexpoints/app/modules/main/views/home/home.page.dart';

import '../pay_page/pay.page.dart';

final List<dynamic> sliderImagesList = [
  // {
  //   'color': '0xffe61919',
  //   'cardNumber': '4566 9876 XXXX XXXX',
  //   'cardHolder': 'ANGEL VELAY',
  //   'cardExpiration': '09/2024',
  // },
  {
    'color': '0xff2222222',
    'cardNumber': '5662 9876 XXXX XXXX',
    'cardHolder': 'JUAN N',
    'cardExpiration': '06/2024',
  },
  {
    'color': '0xffbf930d',
    'cardNumber': '3543 9876 XXXX XXXX',
    'cardHolder': 'FERNANDO P',
    'cardExpiration': '02/2024',
  },
];

class addCreditCard extends StatefulWidget {
  @override
  State<addCreditCard> createState() => _addCreditCardState();
}

class _addCreditCardState extends State<addCreditCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff2222222),
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff2222222),
            title: Text('Selecciona un metodo de Pago'),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(
                  top: 20.0, left: 8.0, right: 8.0, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: 1,
                            onChanged: (value) {
                              setState(() {
                                print(value);
                              });
                            },
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          _buildCreditCard(
                              color: Color(
                                  int.parse(sliderImagesList[index]['color'])),
                              cardExpiration:
                                  "${sliderImagesList[index]['cardExpiration']}",
                              cardHolder:
                                  "${sliderImagesList[index]['cardHolder']}",
                              cardNumber:
                                  "${sliderImagesList[index]['cardNumber']}"),
                        ],
                      );
                    },
                    itemCount: sliderImagesList.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                  ),
                  _anotherPayWay(),
                  _buttonConfirm(),
                  _addCreditCard()
                ],
              ),
            ),
          ),
        ),
      ),
    );
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
        height: 200,
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
          '$label',
          style: TextStyle(
              color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
        ),
        Text(
          '$value',
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
              color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
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

  Widget _gifConfirm() {
    return Center(
        child: AnimatedSplashScreen(
            splashIconSize: 500,
            duration: 3000,
            splash: Container(
              height: 600,
              child: Column(
                children: [
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
            nextScreen: HomePage(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: const Color(0xFFffffff)));
  }

  Widget _buttonConfirm() {
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => _gifConfirm(),
              ),
            );
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
            child: Text(
              'Agregar una tarjeta',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(width: 10),
        Icon(
          Icons.arrow_forward_ios_sharp,
          color: Colors.black,
        ),
      ],
    );
  }
}
