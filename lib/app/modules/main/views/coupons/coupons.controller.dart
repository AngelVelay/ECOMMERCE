import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jexpoints/app/modules/main/entities/coupon.type.dart';
import 'package:jexpoints/app/modules/main/main.module.dart';
import 'package:jexpoints/app/modules/main/services/coupons/coupons.contract.dart';
import 'package:share_plus/share_plus.dart';

class CouponsController extends GetxController {
  final ICouponsService _couponsService;

  var coupons$ = <Coupon>[].obs;
  var selectedCoupon$ = Coupon.fromVoid().obs;

  CouponsController(this._couponsService);

  @override
  void onInit() async {
    var coupons = await _couponsService.get();
    var formatter = DateFormat('dd/MM/yyyy');
    for (var e in coupons) {
      e.formattedValidTo = formatter.format(e.validTo);
    }
    coupons$.value = coupons;
    super.onInit();
  }

  toDetail(Coupon item) {
    selectedCoupon$.value = item;
    Get.toNamed(MainRouting.COUPON_DETAIL_ROUTE, arguments: [item]);
  }

  shareData(Coupon item) async {
    await Share.share(
      item.url,
      subject: '''Codigo: ${item.url}\n'''
          '''Titulo: ${item.title}\n''',
    );
  }

  copyCoupon(Coupon item) {
    Clipboard.setData(ClipboardData(text: item.code));

    Get.snackbar(
      'Copiado',
      'El codigo fue copiado al portapapeles',
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black.withOpacity(0.5),
      duration: Duration(seconds: 2),
    );
  }
}
