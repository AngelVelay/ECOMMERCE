// ignore_for_file: unrelated_type_equality_checks

import '../../entities/flyer.type.dart';
import 'flyers.contract.dart';

class FlyersFakeService implements IFlyersService {
  final _flyers = <Flyer>[
    Flyer(id: 1, url: 'assets/banners/10OFF.png'),
    Flyer(id: 2, url: 'assets/banners/TEMPO.png'),
    Flyer(id: 3, url: 'assets/banners/FELIZCUMPLEAÑOS.png'),
  ];

  @override
  Future<List<Flyer>> getAll() async {
    return _flyers;
  }

  @override
  Future<List<Flyer>> getByCategory(String categoryId) async {
    return _flyers.where((element) => element.id == categoryId).toList();
  }

  @override
  Future<List<Flyer>> getFlyers() {
    return getAll();
  }

  // @override
  // Future<List<Flyer>> getAll() async {
  //   return _flyers;
  // }
}
