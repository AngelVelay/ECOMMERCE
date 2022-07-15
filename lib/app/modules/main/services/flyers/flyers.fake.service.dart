import 'package:jexpoints/app/modules/main/entities/flyer.type.dart';
import 'flyers.contract.dart';

class FlyersFakeService implements IFlyersService {
  final _flyers = <Flyer>[
    Flyer(id: 1, url: 'assets/banners/10OFF.png'),
    Flyer(id: 2, url: 'assets/banners/TEMPO.png'),
    Flyer(id: 3, url: 'assets/banners/FELIZCUMPLEAÑOS.png'),
    // Flyer(
    //     id: 2,
    //     url:
    //         'https://previews.123rf.com/images/studioworkstock/studioworkstock1601/studioworkstock160100006/49971438-restaurante-de-comida-r%C3%A1pida-del-men%C3%BA-de-plantilla-de-vectores-con-elementos-de-ilustraci%C3%B3n-abstract.jpg'),
    // Flyer(
    //     id: 3,
    //     url:
    //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRT1Q5f_Y0ZuqN1mft5gHBtfwl5TgyY608V95_jbXFS-Qo7x4jvc9uLTwFh5Mi8JEfOpPs&usqp=CAU'),
    // Flyer(
    //     id: 4,
    //     url:
    //         'https://1.bp.blogspot.com/-zWOLUmplBks/W5-X5NkS61I/AAAAAAAAAeA/N1GauJFllJcLYEmwhs3xYRBpft78CvcsQCLcBGAs/s1600/SAMSUNG_S8_INFOGRAFIA4.jpg'),
    // Flyer(
    //     id: 5,
    //     url:
    //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwWqfqWZJteW5aSWsmp1aJkqgNgp9UiYWK69pkyw3zY6wbV5BWc-H9pNcw3_-NxcvOyDY&usqp=CAU'),
    // Flyer(
    //     id: 6,
    //     url:
    //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1FhghFqIDVPomjCXn7UBRc53MAePnUNUNhQ&usqp=CAU')
    // Flyer(
    //     id: 1,
    //     url:
    //         'https://i.pinimg.com/474x/b4/e3/85/b4e385df02980536ff75ebe2cb7bb56a.jpg'),
    // Flyer(
    //     id: 2,
    //     url:
    //         'https://previews.123rf.com/images/studioworkstock/studioworkstock1601/studioworkstock160100006/49971438-restaurante-de-comida-r%C3%A1pida-del-men%C3%BA-de-plantilla-de-vectores-con-elementos-de-ilustraci%C3%B3n-abstract.jpg'),
    // Flyer(
    //     id: 3,
    //     url:
    //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRT1Q5f_Y0ZuqN1mft5gHBtfwl5TgyY608V95_jbXFS-Qo7x4jvc9uLTwFh5Mi8JEfOpPs&usqp=CAU'),
    // Flyer(
    //     id: 4,
    //     url:
    //         'https://1.bp.blogspot.com/-zWOLUmplBks/W5-X5NkS61I/AAAAAAAAAeA/N1GauJFllJcLYEmwhs3xYRBpft78CvcsQCLcBGAs/s1600/SAMSUNG_S8_INFOGRAFIA4.jpg'),
    // Flyer(
    //     id: 5,
    //     url:
    //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwWqfqWZJteW5aSWsmp1aJkqgNgp9UiYWK69pkyw3zY6wbV5BWc-H9pNcw3_-NxcvOyDY&usqp=CAU'),
    // Flyer(
    //     id: 6,
    //     url:
    //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1FhghFqIDVPomjCXn7UBRc53MAePnUNUNhQ&usqp=CAU')
  ];

  @override
  Future<List<Flyer>> get() async {
    return _flyers;
  }
}
