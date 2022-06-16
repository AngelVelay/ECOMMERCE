import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jexpoints/app/modules/main/entities/coupon.type.dart';
import 'package:jexpoints/app/modules/main/main.module.dart';
import 'package:jexpoints/app/modules/main/services/coupons/coupons.contract.dart';

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
}
