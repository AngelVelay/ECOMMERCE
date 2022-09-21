import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:jexpoints/app/core/data/entities/request_method.enum.dart';
import 'package:jexpoints/app/core/utils/sheet.utils.dart';
import 'package:jexpoints/app/modules/home/entities/file-manager.type.dart';
import 'package:jexpoints/app/modules/rewards/entities/coupon.type.dart';
import 'package:jexpoints/app/modules/rewards/services/coupons/coupons.contract.dart';

import 'package:jexpoints/app/shared/values/enviroments.dart';

import '../../../../core/data/services/base-service.service.dart';

class CouponDetailController extends GetxController {
  final ICouponsService _couponsService;

  CouponDetailController(this._couponsService);

  var coupon$ = Coupon.fromVoid().obs;
  final couponsList$ = <dynamic>[].obs;
  final couponImage$ = ''.obs;
  List<FileManager> imagesFileLink = [];

  @override
  void onInit() async {
    var args = Get.arguments;
    if (args != null) {
      coupon$.value = args[0];
    } else {
      Get.back();
    }
    couponsList$.value = await _couponsService.getImages();

    couponImage$.value = await imageCoupon();
    super.onInit();
  }

  Future imageCoupon() async {
    var args = Get.arguments;
    var imageUrl = Enviroments.FILE_MANAGER_URL +
        "Files/" +
        Enviroments.FILE_MANAGER_KEY +
        "/" +
        args[0].fileManagerId.toString();

    var response = await http.get(Uri.parse(imageUrl));

    Map<String, dynamic> responseJson = await jsonDecode(response.body);

    var result = await responseJson['fileLink'].toString();

    return await result;
  }

  showTerms(BuildContext context, Widget content) {
    SheetUtils.show(context, content,
        title: 'Terminos y condiciones',
        height: MediaQuery.of(context).size.height - 50);
  }
}
