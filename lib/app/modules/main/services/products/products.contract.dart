import 'package:jexpoints/app/modules/main/entities/product.type.dart';

abstract class IProductsService {
  Future<List<Product>> getTop();
}
