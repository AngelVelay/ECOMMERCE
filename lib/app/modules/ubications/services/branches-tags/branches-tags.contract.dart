import 'package:jexpoints/app/modules/ubications/entities/branches-tags.type.dart';

import '../../entities/sucursal-type.dart';

abstract class IBranchTagsService {
  Future<List<SucursalType>> getBranches();

  Future<List<dynamic>> getSettings(String idBranch);
  Future<List<BranchesTags>> getBranchesTags();
}
