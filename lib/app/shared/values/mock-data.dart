import 'dart:ui';
import 'package:jexpoints/app/modules/main/entities/address.type.dart';
import 'package:jexpoints/app/modules/main/entities/order.type.dart';

import '../../modules/main/entities/credit-card.dart';
import 'dart:math' as math;

class MockData {
  static List<CreditCard> creditCardList = <CreditCard>[
    CreditCard(
      id: 1,
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
      cardNumber: 'XXXX XXXX XXXX 4568',
      cardHolder: 'ANGEL V',
      cardExpiration: '09/2024',
      cvv: '898',
      isDefault: false,
    ),
    CreditCard(
      id: 2,
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
      cardNumber: 'XXXX XXXX XXXX 9874',
      cardHolder: 'JUAN M',
      cardExpiration: '06/2024',
      cvv: '468',
      isDefault: false,
    ),
    CreditCard(
      id: 3,
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
      cardNumber: 'XXXX XXXX XXXX 5698',
      cardHolder: 'PEDRO S',
      cardExpiration: '02/2024',
      cvv: '123',
      isDefault: false,
    ),
  ];

  static List<Address> addressList = <Address>[
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

  static List<Order> ordersList = <Order>[
    Order(
        id: 1,
        name: 'Sucursal Colonia del Valle',
        address: 'Calle Colonia del Valle #123',
        compra: 'Pastel',
        costo: 154,
        puntos: 30,
        fecha: '20/10/2020',
        orderStatusId: OrderStatusEnum.pending,
        orderStatusName: 'Pendiente',
        deliveryType: DeliveryType.envioADomicilio),
    Order(
        id: 2,
        name: 'Sucursal Calz Ignacio Zaragoza',
        address: 'Calz Ignacio Zaragoza #89',
        compra: 'Pastel',
        costo: 56,
        puntos: 10,
        fecha: '20/10/2020',
        orderStatusId: OrderStatusEnum.canceled,
        orderStatusName: 'Cancelado',
        deliveryType: DeliveryType.retiroEnTienda),
    Order(
        id: 3,
        name: 'Pastelerías Romero Rubio',
        address: 'Calle Colonia del Valle #123',
        compra: 'Pastel',
        costo: 89,
        puntos: 56,
        fecha: '20/10/2020',
        orderStatusId: OrderStatusEnum.onRoute,
        orderStatusName: 'En Camino',
        deliveryType: DeliveryType.envioADomicilio),
    Order(
        id: 4,
        name: 'Pastelería Esperanza (Bolivar)',
        address: 'Calle Colonia del Valle #123',
        compra: 'Pastel',
        costo: 89,
        puntos: 15,
        fecha: '20/10/2020',
        orderStatusId: OrderStatusEnum.delivered,
        orderStatusName: 'Entregado',
        deliveryType: DeliveryType.retiroEnTienda),
    Order(
        id: 5,
        name: 'Sucursal Calz Ignacio Zaragoza',
        address: 'Calz Ignacio Zaragoza #89',
        compra: 'Pastel',
        costo: 56,
        puntos: 10,
        fecha: '20/10/2020',
        orderStatusId: OrderStatusEnum.payed,
        orderStatusName: 'Pagado',
        deliveryType: DeliveryType.retiroEnTienda),
    Order(
        id: 6,
        name: 'Pastelerías Romero Rubio',
        address: 'Calle Colonia del Valle #123',
        compra: 'Pastel',
        costo: 89,
        puntos: 56,
        fecha: '20/10/2020',
        orderStatusId: OrderStatusEnum.pending,
        orderStatusName: 'Pendiente',
        deliveryType: DeliveryType.envioADomicilio),
    Order(
        id: 7,
        name: 'Pastelería Esperanza (Bolivar)',
        address: 'Calle Colonia del Valle #123',
        compra: 'Pastel',
        costo: 89,
        puntos: 15,
        fecha: '20/10/2020',
        orderStatusId: OrderStatusEnum.onRoute,
        orderStatusName: 'En Camino',
        deliveryType: DeliveryType.retiroEnTienda)
  ];
}
