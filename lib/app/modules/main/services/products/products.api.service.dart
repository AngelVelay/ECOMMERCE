import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:jexpoints/app/core/data/entities/request_method.enum.dart';
import 'package:jexpoints/app/core/data/services/base-service.service.dart';
import 'package:jexpoints/app/modules/main/entities/product.type.dart';
import 'package:jexpoints/app/modules/main/services/products/products.contract.dart';
import 'package:jexpoints/app/shared/values/enviroments.dart';

class ProductsApiService extends BaseService implements IProductsService {
  ProductsApiService() : super(apiMethod: 'Products', url: Enviroments.API_URL);

  @override
  Future<List<Product>> getByCategory(String categoryId) async {
    var jsonResponse = await provider.request<List<Product>>(
        RequestMethod.get, 'Categories/$categoryId/products');

    var result = jsonDecode(jsonResponse)
        .cast<Map<String, dynamic>>()
        .map<Product>((x) => Product.fromJson(x))
        .toList() as List<Product>;

    result.forEach((element) {
      element.cartValue = 0;
    });

    return result;
  }

  @override
  Future<List<Product>> getFavorites() {
    // TODO: implement getFavorites
    return getProductsVariable();
  }

  @override
  Future<List<Product>> getProductsVariable() async {
    var jsonResponse =
        await provider.request<List<Product>>(RequestMethod.get, 'Products');

    var result = jsonDecode(jsonResponse)
        .cast<Map<String, dynamic>>()
        .map<Product>((x) => Product.fromJson(x))
        .toList() as List<Product>;

    result.forEach((element) {
      element.cartValue = 0;
    });

    return result;
  }

  @override
  Future<List<Product>> getTop() {
    return getProductsVariable();
  }

  @override
  Future<List<Product>> search(String keyword) {
    // TODO: implement search
    throw UnimplementedError();
  }
}
