import 'package:jexpoints/app/modules/home/entities/address.type.dart';

abstract class IAddressService {
  Future<List<UserAddress>> getFromCurrent();
  Future<UserAddress> save(UserAddress item);
}
