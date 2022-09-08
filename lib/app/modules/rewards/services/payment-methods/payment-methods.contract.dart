import 'package:jexpoints/app/modules/rewards/entities/payment-methods.type.dart';

abstract class IPaymentMethodsService {
  Future<List<PaymentMethods>> getPayment();
  Future<PaymentMethods> save(PaymentMethods creditCard);
}
