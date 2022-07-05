import 'package:jexpoints/app/modules/main/entities/my-shopping.type.dart';

abstract class IShoppingService {
  Future<List<MyShopping>> get();
  Future<List<MyShopping>> search(String keyword);
}
