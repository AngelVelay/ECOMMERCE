import 'package:jexpoints/app/modules/main/entities/location.type.dart';

abstract class IAddressService {
  Future<List<Address>> getFromCurrent();
}
