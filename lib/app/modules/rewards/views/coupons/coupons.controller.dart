import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jexpoints/app/modules/rewards/services/coupons/coupons.contract.dart';

import 'package:share_plus/share_plus.dart';

import '../../entities/coupon.type.dart';
import '../../rewards.module.dart';

class CouponsController extends GetxController {
  final ICouponsService _couponsService;

  var coupons$ = <dynamic>[].obs;
  var selectedCoupon$ = Coupon.fromVoid().obs;
  final couponsList$ = <dynamic>[].obs;
  final couponImage$ = <dynamic>[].obs;

  // var couponsImages$ = <dynamic>[].obs;

  CouponsController(this._couponsService);

  @override
  void onInit() async {
    // var coupons = await _couponsService.getImages();
    // var coupons1 = await _couponsService.getAll();
    var image = await _couponsService.getFileId();

    // couponsList$.value = await _couponsService.getImages() as List<dynamic>;

    // var imagetoShow = await _couponsService.getImages();
    // couponsImages$.value = imagetoShow;

    // var formatter = DateFormat('dd/MM/yyyy');
    // for (var e in coupons) {
    //   e.formattedValidTo = formatter.format(e.validTo);
    // }

    coupons$.value = await _couponsService.getAll();
    couponImage$.value = await _couponsService.getImages();

    super.onInit();
  }

  toDetail(Coupon item) {
    selectedCoupon$.value = item;
    Get.toNamed(RewardsRouting.COUPON_DETAIL_ROUTE, arguments: [item]);
  }

  // shareData(Coupon item) async {
  //   await Share.share(
  //     item.fileManagerThumbnail.,
  //     subject: '''Codigo: ${item.url}\n'''
  //         '''Titulo: ${item.title}\n''',
  //   );
  // }

  copyCoupon(Coupon item) {
    Clipboard.setData(ClipboardData(text: item.code.toString()));

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
