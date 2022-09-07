import 'package:jexpoints/app/modules/ubications/entities/branches-tags.type.dart';

abstract class IBranchTagsService {
  Future<List<BranchesTags>> getTags();
}
