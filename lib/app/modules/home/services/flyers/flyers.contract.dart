import '../../entities/flyer.type.dart';

abstract class IFlyersService {
  Future<List<Flyer>> getFlyers();
  Future<List<Flyer>> getAll();

  Future<List<Flyer>> getByCategory(String categoryId);
}
