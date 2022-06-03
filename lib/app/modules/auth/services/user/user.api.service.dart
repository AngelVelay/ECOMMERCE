import 'package:jexpoints/app/core/data/services/base-service.service.dart';
import '../../../auth/services/user/user.contract.dart';

class UserApiService extends BaseService implements IUserService {
  UserApiService() : super('Users');

  @override
  Future<void> recoveryPassword(String email) {
    // TODO: implement recoveryPassword
    throw UnimplementedError();
  }
}
