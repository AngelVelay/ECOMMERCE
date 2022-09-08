import 'package:jexpoints/app/modules/rewards/entities/address.type.dart';
import 'package:jexpoints/app/modules/rewards/entities/payment-methods.type.dart';

abstract class IAddressService {
  Future<List<UserAddress>> getFromCurrent();
  Future<UserAddress> save(UserAddress item);
}
