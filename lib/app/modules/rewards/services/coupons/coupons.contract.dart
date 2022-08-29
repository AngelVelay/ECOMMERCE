import 'package:jexpoints/app/modules/rewards/entities/coupon.type.dart';

abstract class ICouponsService {
  Future<List<Coupon>> getAll();
  List<dynamic> getFileId();
  Future<dynamic> getImages();
}
