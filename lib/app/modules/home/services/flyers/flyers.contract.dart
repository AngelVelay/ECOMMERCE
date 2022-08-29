import 'package:jexpoints/app/modules/home/entities/banners.type.dart';

import '../../entities/flyer.type.dart';

abstract class IFlyersService {
  Future<dynamic> getBanners();
  Future<List<FileManger>> getAll();
  List<dynamic> getFileId();

  Future<List<FileManger>> getByCategory(String categoryId);
}
