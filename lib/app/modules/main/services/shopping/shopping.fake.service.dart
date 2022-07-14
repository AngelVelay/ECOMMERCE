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
        estatus: {
          Estatus.pendiente: 'Pendiente',
        },
        deliveryType: DeliveryType.envioADomicilio),
    MyShopping(
        id: 1,
        name: 'Sucursal Calz Ignacio Zaragoza',
        address: 'Calz Ignacio Zaragoza #89',
        compra: 'Pastel',
        costo: '56',
        puntos: '10',
        fecha: '20/10/2020',
        estatus: {
          Estatus.cancelado: 'Cancelado',
        },
        deliveryType: DeliveryType.retiroEnTienda),
    MyShopping(
        id: 1,
        name: 'Pastelerías Romero Rubio',
        address: 'Calle Colonia del Valle #123',
        compra: 'Pastel',
        costo: '89',
        puntos: '56',
        fecha: '20/10/2020',
        estatus: {
          Estatus.enCamino: 'En camino',
        },
        deliveryType: DeliveryType.envioADomicilio),
    MyShopping(
        id: 1,
        name: 'Pastelería Esperanza (Bolivar)',
        address: 'Calle Colonia del Valle #123',
        compra: 'Pastel',
        costo: '89',
        puntos: '15',
        fecha: '20/10/2020',
        estatus: {
          Estatus.entregado: 'Entregado',
        },
        deliveryType: DeliveryType.retiroEnTienda),
    MyShopping(
        id: 1,
        name: 'Sucursal Calz Ignacio Zaragoza',
        address: 'Calz Ignacio Zaragoza #89',
        compra: 'Pastel',
        costo: '56',
        puntos: '10',
        fecha: '20/10/2020',
        estatus: {
          Estatus.pagado: 'Pagado',
        },
        deliveryType: DeliveryType.retiroEnTienda),
    MyShopping(
        id: 1,
        name: 'Pastelerías Romero Rubio',
        address: 'Calle Colonia del Valle #123',
        compra: 'Pastel',
        costo: '89',
        puntos: '56',
        fecha: '20/10/2020',
        estatus: {
          Estatus.pendiente: 'Pendiente',
        },
        deliveryType: DeliveryType.envioADomicilio),
    MyShopping(
        id: 1,
        name: 'Pastelería Esperanza (Bolivar)',
        address: 'Calle Colonia del Valle #123',
        compra: 'Pastel',
        costo: '89',
        puntos: '15',
        fecha: '20/10/2020',
        estatus: {
          Estatus.enCamino: 'En camino',
        },
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

    // @override
    // Future<List<MyShopping>> search(String keyword) async {
    //   keyword = keyword.toLowerCase();
    //   var result =
    //       compras.where((e) => e.name.toLowerCase().contains(keyword)).toList();
    //   print(result);
    //   return result;
    // }

    Future getShoppingbyName(String name) async {
      name = name.toLowerCase();
      var result =
          compras.where((e) => e.name.toLowerCase().contains(name)).toList();
      return result;
    }
  }

  @override
  Future<List<MyShopping>> search(String keyword) async {
    keyword = keyword.toLowerCase();
    var result =
        compras.where((e) => e.name.toLowerCase().contains(keyword)).toList();
    print(result);
    return result;
  }
}
