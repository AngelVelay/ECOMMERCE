import 'package:jexpoints/app/modules/main/entities/catalogues-tab.dart';
import 'package:jexpoints/app/modules/main/entities/credit-card.dart';
import 'package:jexpoints/app/modules/main/entities/flyer.type.dart';

abstract class ICatalogueService {
  Future<List<Catalogue>> get();
}
