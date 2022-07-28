import 'package:jexpoints/app/modules/main/entities/business-line.type.dart';

abstract class IBusinessLinesService {
  Future<List<BusinessLine>> get();
}
