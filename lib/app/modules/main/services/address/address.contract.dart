import 'package:jexpoints/app/modules/main/entities/address.type.dart';

abstract class IAddressService {
  Future<List<Address>> getFromCurrent();
  Future<Address> save(Address item);
}
