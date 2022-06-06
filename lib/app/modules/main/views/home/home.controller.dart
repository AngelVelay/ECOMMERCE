import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:jexpoints/app/shared/values/enviroments.dart';

import 'home.page.dart';

class HomeController extends GetxController {
  List<dynamic> topProductList = [
    {'name': 'Babka Canela', 'points': 45, 'image': 'BABKA CANELA'},
    {'name': 'Barquillo Danés', 'points': 30, 'image': 'BARQUILLO DANÉS'},
    {'name': 'Chocolatin', 'points': 20, 'image': 'CHOCOLATÍN'},
    {'name': 'Concha Nuez', 'points': 45, 'image': 'CONCHA NUEZ GDE'},
    {'name': 'Concha Chocolate', 'points': 56, 'image': 'CONCHA CHOCOLATE'},
    {'name': 'Cuerno', 'points': 18, 'image': 'CUERNO'},
    {
      'name': 'Danish Cheesecake',
      'points': 19,
      'image': 'DANISH CON CHEESECAKE'
    },
    {
      'name': 'Dona Doble Chocolate',
      'points': 13,
      'image': 'DONA DOBLE CHOCOLATE'
    },
    {'name': 'Fresas con Crema', 'points': 22, 'image': 'FRESA CREMA'},
    {'name': 'Latte Grande', 'points': 18, 'image': 'LATTE GDE'},
    {'name': 'Long Chocolate', 'points': 5, 'image': 'LONG CHOCOLAT'},
    {'name': 'Manjar de Cajeta', 'points': 15, 'image': 'MANJAR CAJETA'},
  ];

  // final List<String> sliderImagesList = [
  //   'https://i.pinimg.com/474x/b4/e3/85/b4e385df02980536ff75ebe2cb7bb56a.jpg',
  //   'https://previews.123rf.com/images/studioworkstock/studioworkstock1601/studioworkstock160100006/49971438-restaurante-de-comida-r%C3%A1pida-del-men%C3%BA-de-plantilla-de-vectores-con-elementos-de-ilustraci%C3%B3n-abstract.jpg',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRT1Q5f_Y0ZuqN1mft5gHBtfwl5TgyY608V95_jbXFS-Qo7x4jvc9uLTwFh5Mi8JEfOpPs&usqp=CAU',
  //   'https://1.bp.blogspot.com/-zWOLUmplBks/W5-X5NkS61I/AAAAAAAAAeA/N1GauJFllJcLYEmwhs3xYRBpft78CvcsQCLcBGAs/s1600/SAMSUNG_S8_INFOGRAFIA4.jpg',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwWqfqWZJteW5aSWsmp1aJkqgNgp9UiYWK69pkyw3zY6wbV5BWc-H9pNcw3_-NxcvOyDY&usqp=CAU',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1FhghFqIDVPomjCXn7UBRc53MAePnUNUNhQ&usqp=CAU'
  // ];

  final List<String> sliderImagesList = [
    'https://acortar.link/GnYwPs',
    'https://acortar.link/GUPy1Y',
    'https://acortar.link/nJdMRU',
    'https://acortar.link/gmuSe1',
    'https://acortar.link/cGCbz6',
    'https://acortar.link/NBE4ZC'
  ];
  @override
  void onInit() {
    super.onInit();
    imagesUrl();
  }

  Future<void> imagesUrl() async {
    topProductList.forEach((element) {
      element['url'] =
          '${Enviroments.FILES_URL}ECOMMERCE/${element['image']}.jpg';
    });
  }

  Future<void> images() async {
    const String apiEndpoint = '${Enviroments.FILES_URL}ECOMMERCE/';
    final Uri url = Uri.parse(apiEndpoint);
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
    }
  }

  consumeTap(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text(
                    'Sucursal Colonia del Valle',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Calle Colonia del Valle #123',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.48,
                    child: const chooseAddress(),
                  ),
                ],
              ),
            ));
  }
}
