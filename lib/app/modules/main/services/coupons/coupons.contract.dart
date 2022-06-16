import 'package:jexpoints/app/modules/main/entities/coupon.type.dart';
import 'package:jexpoints/app/modules/main/entities/flyer.type.dart';

abstract class ICouponsService {
  Future<List<Coupon>> get();
}
