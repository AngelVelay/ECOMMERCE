import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../entities/credit-card.dart';
import '../../services/creditCard/creditCard.contract.dart';

class ConfirmPagoController extends GetxController {
  final ICreditCardService creditCardService;

  late var creditCardList$ = <CreditCard>[].obs;

  ConfirmPagoController(this.creditCardService);

  @override
  void onInit() async {
    super.onInit();
    creditCardList$.value = await creditCardService.get();
  }
}
