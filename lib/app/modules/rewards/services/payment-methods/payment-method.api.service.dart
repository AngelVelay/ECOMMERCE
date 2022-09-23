import 'dart:convert';

import 'package:jexpoints/app/core/data/entities/request_method.enum.dart';
import 'package:jexpoints/app/core/data/services/base-service.service.dart';
import 'package:jexpoints/app/modules/rewards/entities/payment-methods.type.dart';
import 'package:jexpoints/app/modules/rewards/entities/point-level.type.dart';
import 'package:jexpoints/app/modules/rewards/services/payment-methods/payment-methods.contract.dart';
import 'package:jexpoints/app/shared/values/enviroments.dart';

class PaymentMethodsService extends BaseService
    implements IPaymentMethodsService {
  List<PaymentMethods> resultPayment = [];
  PaymentMethodsService()
      : super(
            apiMethod: 'UserPaymentMethods', url: Enviroments.FILE_MANAGER_URL);

  @override
  Future<List<PaymentMethods>> getPayment() async {
    var jsonResponse = await provider.request<List<PaymentMethods>>(
        RequestMethod.get, 'UserPaymentMethods');

    var result = jsonDecode(jsonResponse)
        .cast<Map<String, dynamic>>()
        .map<PaymentMethods>((x) => PaymentMethods.fromJson(x))
        .toList() as List<PaymentMethods>;
    return result;
  }

  @override
  Future<PaymentMethods> save(PaymentMethods creditCard) async {
    var jsonResponse = await provider.request<List<PaymentMethods>>(
        RequestMethod.post, 'UserPaymentMethods',
        body: json.encode(creditCard));

    var result = jsonDecode(jsonResponse);
    return PaymentMethods.fromJson(result);
  }
}

  // @override
  // Future<String> post(Object item,
  //     {String urlComplement = '', bool useCustomUrl = false}) {
  //   return provider.request(
  //       RequestMethod.post, _solveUrl(urlComplement, useCustomUrl),
  //       useDefaultUrl: !(_url != null && _url != ''), body: json.encode(item));
  // }