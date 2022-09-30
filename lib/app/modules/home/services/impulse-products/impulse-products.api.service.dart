import 'dart:convert';

import 'package:jexpoints/app/core/data/entities/request_method.enum.dart';
import 'package:jexpoints/app/core/data/services/base-service.service.dart';
import 'package:jexpoints/app/modules/home/entities/impulse-products.type.dart';
import 'package:jexpoints/app/modules/home/services/impulse-products/impulse-products.contract.dart';
import 'package:jexpoints/app/modules/main/entities/product.type.dart';
import 'package:jexpoints/app/shared/values/enviroments.dart';

class ProductsImpulseApiService extends BaseService
    implements IProductsImpulseService {
  ProductsImpulseApiService()
      : super(apiMethod: 'ImpulseProducts', url: Enviroments.API_URL);

  @override
  Future<List<ImpulseProducts>> getProductsImpulse() async {
    var jsonResponse = await provider.request<List<ImpulseProducts>>(
        RequestMethod.get, 'ImpulseProducts');

    var result = jsonDecode(jsonResponse)
        .cast<Map<String, dynamic>>()
        .map<ImpulseProducts>((x) => ImpulseProducts.fromJson(x))
        .toList() as List<ImpulseProducts>;

    result.forEach((element) {
      element.cartValue = 0;
    });

    return result;
  }
}
