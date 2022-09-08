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

    // result = resultPayment;

    return result;
  }

  @override
  Future<PaymentMethods> save(PaymentMethods creditCard) {
    // TODO: implement save
    throw UnimplementedError();
  }
}
