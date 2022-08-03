import 'package:jexpoints/app/modules/main/entities/credit-card.dart';
import 'package:jexpoints/app/modules/main/entities/flyer.type.dart';

abstract class ICreditCardService {
  Future<List<CreditCard>> get();
  Future<CreditCard> save(CreditCard creditCard);

  // Future<List<CreditCard>> addCreditCard();
}
