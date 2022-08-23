import 'dart:convert';

import 'package:jexpoints/app/shared/values/enviroments.dart';

import '../../../../core/data/entities/request_method.enum.dart';
import '../../../../core/data/services/base-service.service.dart';
import '../../entities/flyer.type.dart';
import 'flyers.contract.dart';

class FlyersApiService extends BaseService implements IFlyersService {
  FlyersApiService() : super(apiMethod: 'Flyers', url: Enviroments.API_URL);

  @override
  Future<List<Flyer>> getFlyers() async {
    var jsonResponse =
        await provider.request<List<Flyer>>(RequestMethod.get, 'Banners');

    var result = jsonDecode(jsonResponse)
        .cast<Map<String, dynamic>>()
        .map<Flyer>((x) => Flyer.fromJson(x))
        .toList() as List<Flyer>;

    result.forEach((element) {
      element.id = 0;
    });

    return result;
  }

  @override
  Future<List<Flyer>> getByCategory(String categoryId) async {
    var jsonResponse = await provider.request<List<Flyer>>(
        RequestMethod.get, 'Categories/$categoryId/banners');

    var result = jsonDecode(jsonResponse)
        .cast<Map<String, dynamic>>()
        .map<Flyer>((x) => Flyer.fromJson(x))
        .toList() as List<Flyer>;

    result.forEach((element) {
      element.id = 0;
    });

    return result;
  }

  @override
  Future<List<Flyer>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }
}
