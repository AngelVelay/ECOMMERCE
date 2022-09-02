import 'dart:convert';

import 'package:jexpoints/app/modules/home/entities/banners.type.dart';
import 'package:jexpoints/app/shared/values/enviroments.dart';

import '../../../../core/data/entities/request_method.enum.dart';
import '../../../../core/data/services/base-service.service.dart';
import '../../entities/flyer.type.dart';
import 'flyers.contract.dart';
import 'package:http/http.dart' as http;

class FlyersApiService extends BaseService implements IFlyersService {
  List<FileManger> resultBanners1 = [];
  List<dynamic> imageFile = [];
  List<dynamic> imagetoShowList = [];
  List<dynamic> responseImage = [];
  List<dynamic> imageById = [];

  FlyersApiService()
      : super(apiMethod: 'Banners', url: Enviroments.FILE_MANAGER_URL);

  @override
  Future<List<FileManger>> getAll() async {
    var jsonResponse =
        await provider.request<List<FileManger>>(RequestMethod.get, 'Banners');

    var resultBanner = jsonDecode(jsonResponse)
        .cast<Map<String, dynamic>>()
        .map<FileManger>((x) => FileManger.fromJson(x))
        .toList() as List<FileManger>;

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
      imageById.add(element.fileManagerId);
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
