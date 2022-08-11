import 'package:jexpoints/app/modules/rewards/entities/billing.type.dart';

import '../../../main/entities/cfdi.type.dart';
import 'billings.contract.dart';

class BillingsFakeService implements IBillingsService {
  final _billings = <Billing>[
    Billing(
      rfc: '',
      business: '',
      mail: '',
      cfdi: Cfdi.fromVoid(),
      type: {'value': '', 'label': ''},
    ),
  ];

  final billingsType = [
    {'value': 1, 'label': 'Compra en Linea'},
    {'value': 2, 'label': 'Compra en Sucursal'},
    {'value': 3, 'label': 'Compras con la aplicación'},
    {'value': 3, 'label': 'Compras Ligadas a una Orden'},
    {'value': 4, 'label': 'Otros'},
  ];

  @override
  Future<List<Billing>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }
}
