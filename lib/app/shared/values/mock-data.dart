import 'dart:ui';
import '../../modules/main/entities/credit-card.dart';
import 'dart:math' as math;

class MockData {
  static List<CreditCard> creditCardList = <CreditCard>[
    CreditCard(
      id: 1,
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
      cardNumber: '4566 9876 XXXX XXXX',
      cardHolder: 'ANGEL V',
      cardExpiration: '09/2024',
      cvv: '898',
      isDefault: false,
    ),
    CreditCard(
      id: 2,
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
      cardNumber: '5662 9876 XXXX XXXX',
      cardHolder: 'JUAN M',
      cardExpiration: '06/2024',
      cvv: '468',
      isDefault: false,
    ),
    CreditCard(
      id: 3,
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
      cardNumber: '3543 9876 XXXX XXXX',
      cardHolder: 'PEDRO S',
      cardExpiration: '02/2024',
      cvv: '123',
      isDefault: false,
    ),
  ];
}