import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

import '../../../../components/custom_input/custom_input.dart';
import '../../../../components/points/points.widget.dart';

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
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlP42IpEI_A3Z79-YLoqy4x1vskyPeLiTdLQ&usqp=CAU',
    'title': 'Concha de Chocolate',
    'puntos': '40',
    'precio': '15'
  },
];

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Mis Compras',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black)),
            cartProduct(),
            Padding(
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
                    Navigator.pushNamed(context, '/pay');
                  },
                  label: const Text('Pagar',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white)),
                ),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}

class cartProduct extends StatelessWidget {
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
