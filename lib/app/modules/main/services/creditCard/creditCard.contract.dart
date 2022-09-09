import 'package:jexpoints/app/modules/main/entities/credit-card.dart';
import 'package:jexpoints/app/modules/rewards/entities/payment-methods.type.dart';

abstract class ICreditCardService {
  Future<List<PaymentMethods>> get();
  Future<PaymentMethods> save(PaymentMethods creditCard);

  // Future<List<CreditCard>> addCreditCard();
}
