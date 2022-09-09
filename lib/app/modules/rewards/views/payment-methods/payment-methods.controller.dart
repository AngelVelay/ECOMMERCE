import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/entities/credit-card.dart';
import 'package:jexpoints/app/modules/main/main.module.dart';
import 'package:jexpoints/app/modules/rewards/entities/payment-methods.type.dart';
import 'package:jexpoints/app/modules/rewards/services/payment-methods/payment-methods.contract.dart';

import '../../../cart/cart.module.dart';
import '../../../main/services/creditCard/creditCard.contract.dart';

class PaymentMethodsController extends GetxController {
  // final ICreditCardService _paymentMethodsService;
  final IPaymentMethodsService paymentMethodsService;

  // late var paymentMethods$ = <CreditCard>[].obs;
  late var paymentMethods$ = <PaymentMethods>[].obs;

  PaymentMethodsController(this.paymentMethodsService);

  @override
  void onInit() async {
    super.onInit();
    // paymentMethods$.value = await _paymentMethodsService.get();
    paymentMethods$.value = await paymentMethodsService.getPayment();
  }

  toAdd() {
    Get.toNamed(CartRouting.PAY_ROUTE);
  }

  toDetail(PaymentMethods card) {
    Get.toNamed(CartRouting.PAY_ROUTE, arguments: [card]);
  }
}
