import 'package:jexpoints/app/modules/main/entities/address.type.dart';
import 'address.contract.dart';

class AddressFakeService implements IAddressService {
  final _address = <Address>[
    Address(
        id: 1,
        alias: 'Casa',
        zipCode: '14200',
        street: 'Calle Alamo',
        outsideNumber: '123',
        isDefault: true,
        contactName: 'Juan Alvarez',
        contactPhone: '5584693587',
        country: 'México',
        insideNumber: 'S/N',
        state: 'CDMX',
        suburb: 'CTM Culhuacan',
        town: 'Coyoacan'),
    Address(
        id: 2,
        alias: 'Oficina',
        zipCode: '14200',
        street: 'Calle 3 sureste',
        outsideNumber: '589',
        isDefault: false,
        contactName: 'Maria Antonieta',
        contactPhone: '5548567289',
        country: 'México',
        insideNumber: '2',
        state: 'CDMX',
        suburb: 'San Juan',
        town: 'Tlahuac'),
  ];

  @override
  Future<List<Address>> getFromCurrent() async {
    return _address;
  }

  @override
  Future<Address> save(Address item) async {
    // var current = _address.firstWhere((element) => element.id == item.id);
    // current = item;
    return item;
  }
}
