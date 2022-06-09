import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:jexpoints/app/modules/main/entities/credit-card.dart';
import 'package:jexpoints/app/modules/main/services/creditCard/creditCard.contract.dart';

class AddCardController extends GetxController {
  final ICreditCardService creditCardService;

  late var creditCardList$ = <CreditCard>[].obs;

  AddCardController(this.creditCardService);

  @override
  void onInit() async {
    super.onInit();
    creditCardList$.value = await creditCardService.get();
  }
}
