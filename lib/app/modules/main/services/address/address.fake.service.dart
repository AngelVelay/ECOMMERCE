import 'package:jexpoints/app/modules/main/entities/location.type.dart';
import 'address.contract.dart';

class AddressFakeService implements IAddressService {
  final _address = <Address>[
    Address(
        id: 1,
        name: 'Casa',
        zipcode: '14200',
        street: 'Calle Alamo',
        number: '123',
        isDefault: true),
    Address(
        id: 1,
        name: 'Oficina',
        zipcode: '35800',
        street: 'San Pablo',
        number: '548',
        isDefault: false),
  ];

  @override
  Future<List<Address>> getFromCurrent() async {
    return _address;
  }
}
