import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jexpoints/app/modules/main/views/main/main.page.dart';

import '../../../../components/custom_input/custom_input.dart';
import '../../main.module.dart';
import '../tab-home/tab-home.page.dart';

final List<Map<String, String>> productsList = [
  {
    'url':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1w3DfHY1rczx50CtpyT7WQWM7DzgJO51Rww&usqp=CAU',
    'title': 'Pastel de Chocolate',
    'puntos': '30',
    'precio': '250'
  },
  {
    'url':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaMIgHTCOHYmVBhq3Fu_7LILYd1ONWeT8AmQ&usqp=CAU',
    'title': 'Pan Blanco',
    'puntos': '50',
    'precio': '50'
  },
  {
    'url':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz-uOqi6OOH-5WdxCfboKBJzsFxGn_7WpH8A&usqp=CAU',
    'title': 'Pan de Muerto',
    'puntos': '80',
    'precio': '180'
  },
  {
    'url':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-XaE3eZ7-TOq0Da7FhHcmmlxU2zwhc6ydbQ&usqp=CAU',
    'title': 'Bollos',
    'puntos': '10',
    'precio': '130'
  },
  {
    'url':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz-uOqi6OOH-5WdxCfboKBJzsFxGn_7WpH8A&usqp=CAU',
    'title': 'Pan de Muerto',
    'puntos': '80',
    'precio': '180'
  },
  {
    'url':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-XaE3eZ7-TOq0Da7FhHcmmlxU2zwhc6ydbQ&usqp=CAU',
    'title': 'Bollos',
    'puntos': '10',
    'precio': '130'
  },
  {
    'url':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz-uOqi6OOH-5WdxCfboKBJzsFxGn_7WpH8A&usqp=CAU',
    'title': 'Pan de Muerto',
    'puntos': '80',
    'precio': '180'
  },
  {
    'url':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-XaE3eZ7-TOq0Da7FhHcmmlxU2zwhc6ydbQ&usqp=CAU',
    'title': 'Bollos',
    'puntos': '10',
    'precio': '130'
  },
];

class ConfirmBuyPage extends StatelessWidget {
  const ConfirmBuyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Confirmar Compra'),
            backgroundColor: Color(0xff222222),
          ),
          body: Column(
            children: [
              Text(''),
              Expanded(child: _confirmarCompra(context)),
              Expanded(
                child: Column(
                  children: [
                    _applyCoupon(context),
                    _totalBuy(context),
                    // PopularProducts('Sugerencias de Compra'),
                    _buttonConfirm(context)
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget _totalBuy(context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Subtotal',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              Text(
                '\$480',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Envio',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              Text(
                '\$50',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Cupon de Descuento',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              Text(
                ' - \$50',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Total a Pagar',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                '\$480',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _confirmarCompra(context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: productsList.length,
        itemBuilder: (BuildContext context, int index) {
          return SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 80,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: FadeInImage(
                            placeholder: const NetworkImage(
                                'https://tenor.com/view/loading-gif-9212724.gif'),
                            image: NetworkImage(
                                productsList[index]['url'].toString()),
                          )),
                    ),
                    Expanded(
                        child: ListTile(
                      title: Text(
                        '${productsList[index]['title']}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$ ${productsList[index]['precio']}',
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            '${productsList[index]['puntos']} pts',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: const [
                              Icon(Icons.remove_circle_outline_outlined,
                                  size: 25, color: Colors.black),
                              Text('1', style: TextStyle(fontSize: 25)),
                              Icon(Icons.add_circle_outline_outlined,
                                  size: 25, color: Colors.black),
                            ],
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
          );
        });
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
            child: Expanded(
              child: Container(
                height: 60,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color(0xff222222),
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  'Aplicar',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
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
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => _gifConfirm(),
            //   ),
            // );
            Get.toNamed('/checkout');
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
            nextScreen: MainPage(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: const Color(0xFFffffff)));
  }
}
