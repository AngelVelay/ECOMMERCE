import 'package:jexpoints/app/modules/main/entities/category.type.dart';
import 'package:jexpoints/app/modules/main/entities/credit-card.dart';
import 'package:jexpoints/app/modules/main/entities/flyer.type.dart';

abstract class ICategoriesService {
  Future<List<Category>> get();
}
