import 'package:jexpoints/app/modules/main/entities/my-shopping.type.dart';
import 'package:jexpoints/app/modules/main/services/shopping/shopping.contract.dart';

class ShoppingFakeService implements IShoppingService {
  final compras = <MyShopping>[
    MyShopping(
        id: 1,
        name: 'Sucursal Colonia del Valle',
        address: 'Calle Colonia del Valle #123',
        compra: 'Pastel',
        costo: '154',
        puntos: '30',
        fecha: '20/10/2020',
        estatus: Estatus.pagado,
        deliveryType: DeliveryType.envioADomicilio),
    MyShopping(
        id: 1,
        name: 'Sucursal Calz Ignacio Zaragoza',
        address: 'Calz Ignacio Zaragoza #89',
        compra: 'Pastel',
        costo: '56',
        puntos: '10',
        fecha: '20/10/2020',
        estatus: Estatus.enCamino,
        deliveryType: DeliveryType.retiroEnTienda),
    MyShopping(
        id: 1,
        name: 'Pastelerías Romero Rubio',
        address: 'Calle Colonia del Valle #123',
        compra: 'Pastel',
        costo: '89',
        puntos: '56',
        fecha: '20/10/2020',
        estatus: Estatus.pagado,
        deliveryType: DeliveryType.envioADomicilio),
    MyShopping(
        id: 1,
        name: 'Pastelería Esperanza (Bolivar)',
        address: 'Calle Colonia del Valle #123',
        compra: 'Pastel',
        costo: '89',
        puntos: '15',
        fecha: '20/10/2020',
        estatus: Estatus.esperando,
        deliveryType: DeliveryType.retiroEnTienda)
  ];

  @override
  Future<List<MyShopping>> get() async {
    return compras;
  }

  Future getByDeliveryType() async {
    if (compras.length > 0) {
      return compras
          .where(
              (element) => element.deliveryType == DeliveryType.envioADomicilio)
          .toList();
    }

    Future getByTakeAwayType() async {
      if (compras.length > 0) {
        return compras
            .where((element) =>
                element.deliveryType == DeliveryType.retiroEnTienda)
            .toList();
      }
    }

    Future getByPendingType() async {
      if (compras.length > 0) {
        return compras
            .where((element) => element.estatus == Estatus.esperando)
            .toList();
      }
    }
  }
}
