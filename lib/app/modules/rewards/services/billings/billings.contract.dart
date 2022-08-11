import 'package:jexpoints/app/modules/rewards/entities/coupon.type.dart';

import '../../entities/billing.type.dart';

abstract class IBillingsService {
  Future<List<Billing>> getAll();
}
