import 'dart:convert';

import 'package:jexpoints/app/core/data/entities/request_method.enum.dart';
import 'package:jexpoints/app/core/data/services/base-service.service.dart';
import 'package:jexpoints/app/modules/ubications/entities/branches-tags.type.dart';
import 'package:jexpoints/app/modules/ubications/entities/sucursal-type.dart';
import 'package:jexpoints/app/modules/ubications/services/branches-tags/branches-tags.contract.dart';
import 'package:jexpoints/app/shared/values/enviroments.dart';

class BranchesTagsService extends BaseService implements IBranchTagsService {
  BranchesTagsService()
      : super(apiMethod: 'BranchesTags', url: Enviroments.API_URL);

  @override
  Future<List<BranchesTags>> getBranchesTags() async {
    var jsonResponse = await provider.request<List<BranchesTags>>(
        RequestMethod.get, 'BranchesTags');

    var result = jsonDecode(jsonResponse)
        .cast<Map<String, dynamic>>()
        .map<BranchesTags>((x) => BranchesTags.fromJson(x))
        .toList() as List<BranchesTags>;

    return result;
  }

  @override
  Future<List<SucursalType>> getBranches() async {
    var jsonResponse = await provider.request<List<SucursalType>>(
        RequestMethod.get,
        'BranchSettings/${Enviroments.FILE_MANAGER_KEY}/branches');
    var result = jsonDecode(jsonResponse)
        .cast<Map<String, dynamic>>()
        .map<SucursalType>((x) => SucursalType.fromJson(x))
        .toList() as List<SucursalType>;
    return result;
  }

  @override
  Future<List> getSettings(String idBranch) async {
    var jsonResponse = await provider.request<List<dynamic>>(
        RequestMethod.get, 'BranchSettingsTags/$idBranch/Branch');
    var result = jsonDecode(jsonResponse)
        .cast<Map<String, dynamic>>()
        .map((x) => x)
        .toList() as List;
    return result;
  }
}
