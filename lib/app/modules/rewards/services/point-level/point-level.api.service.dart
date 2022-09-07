import 'dart:convert';

import 'package:jexpoints/app/core/data/entities/request_method.enum.dart';
import 'package:jexpoints/app/core/data/services/base-service.service.dart';
import 'package:jexpoints/app/modules/rewards/entities/point-level.type.dart';
import 'package:jexpoints/app/shared/values/enviroments.dart';

import 'point-level.contract.dart';

class PointLevelService extends BaseService implements IPointLevelService {
  // List<PointLevel> resultPointsLevel = [];

  PointLevelService()
      : super(apiMethod: 'PointLevels', url: Enviroments.FILE_MANAGER_URL);

  @override
  Future<List<PointLevel>> getPoints() async {
    var jsonResponse = await provider.request<List<PointLevel>>(
        RequestMethod.get, 'PointLevels');

    var resultPoints = jsonDecode(jsonResponse)
        .cast<Map<String, dynamic>>()
        .map<PointLevel>((x) => PointLevel.fromJson(x))
        .toList() as List<PointLevel>;

    // resultPointsLevel = resultPoints;

    return resultPoints;
  }
}
