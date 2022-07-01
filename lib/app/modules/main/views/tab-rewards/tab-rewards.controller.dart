import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jexpoints/app/core/utils/storage.utils.dart';
import 'package:jexpoints/app/shared/values/globals.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../components/map_ubication/map_ubication.dart';
import '../../../auth/auth.module.dart';
import '../../../auth/entities/user.type.dart';
import '../../../auth/services/auth/auth.contract.dart';
import '../../entities/coupon.type.dart';
import '../../entities/reviews.type.dart';
import '../../main.module.dart';
import '../../services/coupons/coupons.contract.dart';
import '../../services/reviews/reviews.contract.dart';

class RewardsController extends GetxController {
  late IAuthService _repo;
  final ICouponsService _couponsService;
  final IReviewsService _reviewsService;
  var user = User.fromVoid().obs;
  var coupons$ = <Coupon>[].obs;
  var reviews$ = <Review>[].obs;
  var selectedCoupon$ = Coupon.fromVoid().obs;

  RewardsController(this._repo, this._couponsService, this._reviewsService);

  @override
  void onInit() async {
    var coupons = await _couponsService.get();
    var reviews = await _reviewsService.get();
    var formatter = DateFormat('dd/MM/yyyy');
    for (var e in coupons) {
      e.formattedValidTo = formatter.format(e.validTo);
    }
    reviews$.value = reviews;
    coupons$.value = coupons;
    _curretUser();
    super.onInit();
  }

  singInOut() {
    //_googleSignIn.disconnect();

    LocalStorageUtils.setStringKey(Globals.CURRENT_USER_KEY, '');
    Get.toNamed(AuthRouting.LOGIN_ROUTE);
  }

  _curretUser() async {
    var existingUser = await _repo.checkUser();
    if (existingUser != null) {
      user.value = existingUser;
    } else {
      Get.toNamed(AuthRouting.LOGIN_ROUTE);
    }
  }

  toDetail(Coupon item) {
    selectedCoupon$.value = item;
    Get.toNamed(MainRouting.COUPON_DETAIL_ROUTE, arguments: [item]);
  }

  shareData(Coupon item) async {
    await Share.share(
      item.url,
      subject: '''Codigo: ${item.code}\n'''
          '''Titulo: ${item.title}\n''',
    );
  }

  consumeTap(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text(
                    'Sucursal Colonia del Valle',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Calle Colonia del Valle #123',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.48,
                    child: const MapFlutter(),
                  ),
                ],
              ),
            ));
  }
}
