import 'package:jexpoints/app/modules/home/entities/posters.type.dart';

import '../../entities/flyer.type.dart';

abstract class IPostersService {
  Future<dynamic> getBanners();
  Future<List<Posters>> getAll();
  List<dynamic> getFileId();

  Future<List<FileManger>> getByCategory(String categoryId);
}
