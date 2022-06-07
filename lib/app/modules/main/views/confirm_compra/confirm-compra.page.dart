import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../../../../components/popular-product-slider/popular-product-slider.dart';

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
];

class ConfirmarCompraPage extends StatelessWidget {
  const ConfirmarCompraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Confirmar Compra'),
            backgroundColor: Color(0xff222222),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Text(''),
                ConfirmarCompra(),
                SizedBox(height: 20),
                PopularProducts('Sugerencias de Compra'),
                _buttonConfirm(context)
              ],
            ),
          )),
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
            Navigator.pushNamed(context, '/add-credit-card');
          },
          label: const Text('Confirmar',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white)),
        ),
      ),
    );
  }
}

class ConfirmarCompra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: productsList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
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
                          placeholder: NetworkImage(
                              'https://tenor.com/view/loading-gif-9212724.gif'),
                          image: NetworkImage(
                              productsList[index]['url'].toString()),
                        )),
                  ),
                  Expanded(
                      child: ListTile(
                    title: Text(
                      '${productsList[index]['title']}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ ${productsList[index]['precio']}',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          '${productsList[index]['puntos']} pts',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
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
          );
        });
  }
}
