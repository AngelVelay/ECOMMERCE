import 'package:jexpoints/app/modules/main/entities/product.type.dart';

abstract class IProductsService {
  Future<List<Product>> getTop();

  Future<List<Product>> search(String keyword);
  Future<List<Product>> catalogsList();
  Future<List<Product>> getFavorites();

  Future<List<Product>> getProductsVariable();
}
