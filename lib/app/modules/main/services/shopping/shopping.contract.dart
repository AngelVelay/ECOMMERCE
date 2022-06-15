import 'package:jexpoints/app/modules/main/entities/location.type.dart';
import 'package:jexpoints/app/modules/main/entities/my-shopping.type.dart';

abstract class IShoppingService {
  Future<List<MyShopping>> get();
}
