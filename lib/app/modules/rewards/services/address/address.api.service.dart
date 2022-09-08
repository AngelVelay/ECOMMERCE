import 'dart:convert';

import 'package:jexpoints/app/core/data/entities/request_method.enum.dart';
import 'package:jexpoints/app/core/data/services/base-service.service.dart';
import 'package:jexpoints/app/modules/rewards/entities/address.type.dart';
import 'package:jexpoints/app/modules/rewards/entities/payment-methods.type.dart';
import 'package:jexpoints/app/modules/rewards/entities/point-level.type.dart';
import 'package:jexpoints/app/modules/rewards/services/address/address.contract.dart';
import 'package:jexpoints/app/modules/rewards/services/payment-methods/payment-methods.contract.dart';
import 'package:jexpoints/app/shared/values/enviroments.dart';

class AddressService extends BaseService implements IAddressService {
  List<PaymentMethods> resultPayment = [];
  AddressService()
      : super(apiMethod: 'UserAddress', url: Enviroments.FILE_MANAGER_URL);

  @override
  Future<List<UserAddress>> getFromCurrent() async {
    var jsonResponse = await provider.request<List<UserAddress>>(
        RequestMethod.get, 'UserAddress');

    var result = jsonDecode(jsonResponse)
        .cast<Map<String, dynamic>>()
        .map<UserAddress>((x) => UserAddress.fromJson(x))
        .toList() as List<UserAddress>;

    // result = resultPayment;

    return result;
  }

  @override
  Future<UserAddress> save(UserAddress item) {
    // TODO: implement save
    throw UnimplementedError();
  }
}
