import 'package:jexpoints/app/modules/home/entities/impulse-products.type.dart';
import 'package:jexpoints/app/modules/main/entities/product.type.dart';

abstract class IProductsImpulseService {
  Future<List<ImpulseProducts>> getProductsImpulse();
}
