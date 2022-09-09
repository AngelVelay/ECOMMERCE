import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jexpoints/app/modules/home/entities/posters.type.dart';
import 'package:jexpoints/app/shared/values/enviroments.dart';

import '../../../../core/data/entities/request_method.enum.dart';
import '../../../../core/data/services/base-service.service.dart';
import '../../entities/flyer.type.dart';
import 'flyers.contract.dart';
import 'package:http/http.dart' as http;

class FlyersApiService extends BaseService implements IFlyersService {
  List<Posters> resultBanners1 = [];
  List<dynamic> imageFile = [];
  List<dynamic> imagetoShowList = [];
  List<dynamic> responseImage = [];
  List<dynamic> imageById = [];

  FlyersApiService()
      : super(apiMethod: 'Posters', url: Enviroments.FILE_MANAGER_URL);

  @override
  Future<List<Posters>> getAll() async {
    var jsonResponse =
        await provider.request<List<Posters>>(RequestMethod.get, 'Posters');

    var resultBanner = jsonDecode(jsonResponse)
        .cast<Map<String, dynamic>>()
        .map<Posters>((x) => Posters.fromJson(x))
        .toList() as List<Posters>;

    resultBanners1 = resultBanner;
    return resultBanner;
  }

  @override
  Future<List<FileManger>> getByCategory(String categoryId) {
    return getByCategory(categoryId);
  }

  @override
  List<dynamic> getFileId() {
    resultBanners1.forEach((element) {
      imageById.add(element.appFileManagerId);
    });

    return imageById;
  }

  @override
  Future getBanners() async {
    imageById.forEach((element) async {
      var jsonResponse = Enviroments.FILE_MANAGER_URL +
          "Files/" +
          Enviroments.FILE_MANAGER_KEY +
          "/" +
          element;

      var responseBanner = await http.get(Uri.parse(jsonResponse));
      Map<String, dynamic> responseBannerJson = jsonDecode(responseBanner.body);

      responseImage.add(responseBannerJson);
    });
    return responseImage;
  }
}
