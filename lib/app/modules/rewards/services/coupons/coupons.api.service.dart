import 'dart:convert';

import 'package:jexpoints/app/core/data/entities/request_method.enum.dart';
import 'package:jexpoints/app/shared/values/enviroments.dart';

import '../../../../core/data/services/base-service.service.dart';
import '../../entities/coupon.type.dart';
import 'coupons.contract.dart';
import 'package:http/http.dart' as http;

class CouponsApiService extends BaseService implements ICouponsService {
  List<Coupon> resultCoupons1 = [];
  List<dynamic> imageById = [];
  List<dynamic> imagetoShowList = [];
  List<dynamic> responseImage = [];

  CouponsApiService()
      : super(apiMethod: 'Coupons', url: Enviroments.FILE_MANAGER_URL);

  @override
  Future<List<Coupon>> getAll() async {
    var jsonResponse =
        await provider.request<List<Coupon>>(RequestMethod.get, 'Coupons');

    var resultCoupons = jsonDecode(jsonResponse)
        .cast<Map<String, dynamic>>()
        .map<Coupon>((x) => Coupon.fromJson(x))
        .toList() as List<Coupon>;

    resultCoupons1 = resultCoupons;

    return resultCoupons;
  }

  @override
  List<dynamic> getFileId() {
    resultCoupons1.forEach((element) {
      imageById.add(element.fileManagerId);
    });

    return imageById;
  }

  @override
  Future getImages() async {
    imageById.forEach((element) async {
      var jsonResponse = Enviroments.FILE_MANAGER_URL +
          "files/" +
          Enviroments.FILE_MANAGER_KEY +
          "/" +
          element;

      var response = await http.get(Uri.parse(jsonResponse));

      responseImage.add(response);
    });
  }
}
// String url = Enviroments.FILE_MANAGER_URL +
//           "files/" +
//           Enviroments.FILE_MANAGER_KEY +
//           "/" +
//           element;

//       var response = await http.get(Uri.parse(url));
//       var imageCoupons = jsonDecode(response.body);

//       responseImage.add(imageCoupons);
//     });
//     print('response : $responseImage');
//     return responseImage;
