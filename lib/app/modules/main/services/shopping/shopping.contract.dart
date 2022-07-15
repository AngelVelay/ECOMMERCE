import 'package:jexpoints/app/modules/main/entities/order.type.dart';

abstract class IShoppingService {
  Future<List<Order>> get();
  Future<List<Order>> search(String keyword);
  Future<Order> getById(int id);
}
