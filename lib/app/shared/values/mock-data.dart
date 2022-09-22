import 'dart:ui';
import 'package:jexpoints/app/modules/main/entities/address.type.dart';
import 'package:jexpoints/app/modules/main/entities/order.type.dart';

import '../../modules/main/entities/branch.type.dart';
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

  // static List<Address> addressList = <Address>[
  //   Address(
  //       id: 1,
  //       alias: 'Casa',
  //       zipCode: '14200',
  //       street: 'Calle Alamo',
  //       outsideNumber: '123',
  //       isDefault: true,
  //       contactName: 'Juan Alvarez',
  //       contactPhone: '5584693587',
  //       country: 'México',
  //       insideNumber: 'S/N',
  //       state: 'CDMX',
  //       suburb: 'CTM Culhuacan',
  //       town: 'Coyoacan'),
  //   Address(
  //       id: 2,
  //       alias: 'Oficina',
  //       zipCode: '14200',
  //       street: 'Calle 3 sureste',
  //       outsideNumber: '589',
  //       isDefault: false,
  //       contactName: 'Maria Antonieta',
  //       contactPhone: '5548567289',
  //       country: 'México',
  //       insideNumber: '2',
  //       state: 'CDMX',
  //       suburb: 'San Juan',
  //       town: 'Tlahuac'),
  // ];

  static List<Order> ordersList = <Order>[
    Order(
        id: 1,
        name: 'Sucursal Colonia del Valle',
        address: 'Calle Colonia del Valle #123',
        total: 100.0,
        subtotal: 154,
        points: 30,
        date: '20/10/2020',
        orderStatusId: OrderStatusEnum.pending,
        orderStatusName: 'Pendiente',
        deliveryType: DeliveryType.envioADomicilio,
        deliveryAmount: 10),
    Order(
        id: 2,
        name: 'Sucursal Calz Ignacio Zaragoza',
        address: 'Calz Ignacio Zaragoza #89',
        total: 100.0,
        subtotal: 56,
        points: 10,
        date: '20/10/2020',
        orderStatusId: OrderStatusEnum.canceled,
        orderStatusName: 'Cancelado',
        deliveryType: DeliveryType.retiroEnTienda,
        deliveryAmount: 10),
    Order(
        id: 3,
        name: 'Pastelerías Romero Rubio',
        address: 'Calle Colonia del Valle #123',
        total: 100.0,
        subtotal: 89,
        points: 56,
        date: '20/10/2020',
        orderStatusId: OrderStatusEnum.onRoute,
        orderStatusName: 'En Camino',
        deliveryType: DeliveryType.envioADomicilio,
        deliveryAmount: 10),
    Order(
        id: 4,
        name: 'Pastelería Esperanza (Bolivar)',
        address: 'Calle Colonia del Valle #123',
        total: 100.0,
        subtotal: 89,
        points: 15,
        date: '20/10/2020',
        orderStatusId: OrderStatusEnum.delivered,
        orderStatusName: 'Entregado',
        deliveryType: DeliveryType.retiroEnTienda,
        deliveryAmount: 10),
    Order(
        id: 5,
        name: 'Sucursal Calz Ignacio Zaragoza',
        address: 'Calz Ignacio Zaragoza #89',
        total: 100.0,
        subtotal: 56,
        points: 10,
        date: '20/10/2020',
        orderStatusId: OrderStatusEnum.payed,
        orderStatusName: 'Pagado',
        deliveryType: DeliveryType.retiroEnTienda,
        deliveryAmount: 10),
    Order(
        id: 6,
        name: 'Pastelerías Romero Rubio',
        address: 'Calle Colonia del Valle #123',
        total: 100.0,
        subtotal: 89,
        points: 56,
        date: '20/10/2020',
        orderStatusId: OrderStatusEnum.pending,
        orderStatusName: 'Pendiente',
        deliveryType: DeliveryType.envioADomicilio,
        deliveryAmount: 10),
    Order(
        id: 7,
        name: 'Pastelería Esperanza (Bolivar)',
        address: 'Calle Colonia del Valle #123',
        total: 100.0,
        subtotal: 89,
        points: 15,
        date: '20/10/2020',
        orderStatusId: OrderStatusEnum.onRoute,
        orderStatusName: 'En Camino',
        deliveryType: DeliveryType.retiroEnTienda,
        deliveryAmount: 10)
  ];

  static List<Branch> branchList = <Branch>[
    Branch(
        id: 1,
        name: 'Sucursal Colonia del Valle',
        address: 'Calle Colonia del Valle #123',
        working_days: 'Lunes a Domingo',
        working_hours: {
          'Lunes': '8:00 - 18:00',
          'Martes': '8:00 - 18:00',
          'Miercoles': '8:00 - 18:00',
          'Jueves': '8:00 - 18:00',
          'Viernes': '8:00 - 18:00',
          'Sabado': '8:00 - 18:00',
          'Domingo': '8:00 - 18:00'
        },
        phone: '5584693587',
        active: true),
    Branch(
        id: 2,
        name: 'Sucursal Ignacio Zaragoza',
        address: 'Calz Ignacio Zaragoza #89',
        working_days: 'Lunes a Sabado',
        working_hours: {
          'Lunes': '8:00 - 18:00',
          'Martes': '8:00 - 18:00',
          'Miercoles': '8:00 - 18:00',
          'Jueves': '8:00 - 18:00',
          'Viernes': '8:00 - 18:00',
          'Sabado': '8:00 - 18:00',
          'Domingo': '8:00 - 18:00'
        },
        phone: '5548567289',
        active: true),
  ];
}
