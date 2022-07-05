import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/entities/credit-card.dart';
import 'package:jexpoints/app/modules/main/main.module.dart';
import '../../services/creditCard/creditCard.contract.dart';

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
    Get.toNamed(MainRouting.PAY_ROUTE);
  }

  toDetail(CreditCard card) {
    Get.toNamed(MainRouting.PAY_ROUTE, arguments: [card]);
  }
}
