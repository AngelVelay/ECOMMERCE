import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/entities/credit-card.dart';
import 'package:jexpoints/app/modules/main/main.module.dart';

import '../../../cart/cart.module.dart';
import '../../../main/services/creditCard/creditCard.contract.dart';

class PaymentMethodsController extends GetxController {
  final ICreditCardService _paymentMethodsService;

  late var paymentMethods$ = <CreditCard>[].obs;

  PaymentMethodsController(this._paymentMethodsService);

  @override
  void onInit() async {
    super.onInit();
    paymentMethods$.value = await _paymentMethodsService.get();
  }

  toAdd() {
    Get.toNamed(CartRouting.PAY_ROUTE);
  }

  toDetail(CreditCard card) {
    Get.toNamed(CartRouting.PAY_ROUTE, arguments: [card]);
  }
}
