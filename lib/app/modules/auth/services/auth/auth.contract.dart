import 'package:jexpoints/app/modules/auth/entities/branch.type.dart';
import 'package:jexpoints/app/modules/auth/entities/signup.type.dart';

import '../../entities/user.type.dart';

abstract class IAuthService {
  User? user;
  Signup? signup;
  Future<String?> singIn(String username, String password);
  Future<User?> checkUser();
  Future<List<Branch>> getDummyList();
  Future<Signup?> signUp();
  Future<Signup?> validateCode(Signup registrationUser, String code);
}
