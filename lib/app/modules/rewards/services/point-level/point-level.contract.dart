import 'package:jexpoints/app/modules/rewards/entities/point-level.type.dart';

abstract class IPointLevelService {
  Future<List<PointLevel>> getPoints();
}
