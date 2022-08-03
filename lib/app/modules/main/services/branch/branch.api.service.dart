import 'package:jexpoints/app/core/data/services/base-service.service.dart';
import 'package:jexpoints/app/modules/auth/entities/branch.type.dart';
import 'branch.contract.dart';

class BranchApiService extends BaseService implements IBranchService {
  BranchApiService() : super(apiMethod: 'Sucursales');

  @override
  Future<List<Branch>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Branch> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }
}
