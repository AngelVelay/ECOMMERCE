import 'package:jexpoints/app/modules/main/entities/flyer.type.dart';

abstract class IFlyersService {
  Future<List<Flyer>> get();
}
