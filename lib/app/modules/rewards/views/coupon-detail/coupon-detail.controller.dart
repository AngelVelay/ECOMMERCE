import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/core/utils/sheet.utils.dart';
import 'package:jexpoints/app/modules/main/entities/coupon.type.dart';
import 'package:jexpoints/app/modules/rewards/entities/coupon.type.dart';

class CouponDetailController extends GetxController {
  var coupon$ = Coupon.fromVoid().obs;

  @override
  void onInit() async {
    var args = Get.arguments;
    if (args != null) {
      coupon$.value = args[0];
    } else {
      Get.back();
    }
    super.onInit();
  }

  showTerms(BuildContext context, Widget content) {
    SheetUtils.show(context, content,
        title: 'Terminos y condiciones',
        height: MediaQuery.of(context).size.height - 50);
  }
}
