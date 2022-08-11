import 'dart:convert';

import 'package:jexpoints/app/core/data/entities/request_method.enum.dart';
import 'package:jexpoints/app/core/data/services/base-service.service.dart';
import 'package:jexpoints/app/modules/rewards/services/coupons/coupons.contract.dart';
import 'package:jexpoints/app/shared/values/enviroments.dart';

import '../../entities/coupon.type.dart';

class CouponsApiService extends BaseService implements ICouponsService {
  CouponsApiService() : super(apiMethod: 'Coupons', url: Enviroments.API_URL);

  @override
  Future<List<Coupon>> getAll() async {
    var jsonResponse =
        await provider.request<List<Coupon>>(RequestMethod.get, 'Coupons');

    var result = jsonDecode(jsonResponse)
        .cast<Map<String, dynamic>>()
        .map<Coupon>((x) => Coupon.fromJson(x))
        .toList() as List<Coupon>;

    return result;
  }
}
