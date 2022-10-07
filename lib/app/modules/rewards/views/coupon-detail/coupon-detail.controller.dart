import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jexpoints/app/core/data/services/file-manager.service.dart';
import 'package:jexpoints/app/core/utils/sheet.utils.dart';
import 'package:jexpoints/app/modules/rewards/entities/coupon.type.dart';

import 'package:jexpoints/app/shared/values/globals.dart';

class CouponDetailController extends GetxController {
  var coupon$ = Coupon.fromVoid().obs;
  var couponImage$ = ''.obs;
  String formattedEndDate = '';

  @override
  void onInit() async {
    var args = Get.arguments;
    if (args != null) {
      coupon$.value = args[0];
      formattedEndDate = Globals.dateFormat
          .format(DateTime.parse((args[0] as Coupon).endDate!));
    } else {
      Get.back();
    }
    couponImage$.value = await imageCoupon();
    super.onInit();
  }

  Future imageCoupon() async {
    var coupon =
        await FileManagerService().getById(coupon$.value.fileManagerId!);
    return coupon.fileLink;
  }

  showTerms(BuildContext context, Widget content) {
    SheetUtils.show(context, content,
        title: 'Terminos y condiciones',
        height: MediaQuery.of(context).size.height - 200);
  }
}
