import 'package:jexpoints/app/modules/main/entities/credit-card.dart';
import 'package:jexpoints/app/modules/main/entities/flyer.type.dart';
import 'package:jexpoints/app/modules/main/views/add_credit_card/addCreditCard.page.dart';

abstract class ICreditCardService {
  Future<List<CreditCard>> get();
  Future<List<CreditCard>> getFromCurrent();

  // Future<List<CreditCard>> addCreditCard();
}
