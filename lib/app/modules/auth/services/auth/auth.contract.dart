import 'package:jexpoints/app/modules/auth/entities/branch.type.dart';
import 'package:jexpoints/app/modules/auth/entities/signup.type.dart';

import '../../entities/user.type.dart';

abstract class IAuthService {
  User? user;
  Future<User?> singIn(String username, String password);
  Future<User?> checkUser();
  Future<List<Branch>> getDummyList();
  Future signUp(Signup registrationUser);
  Future<Signup?> validateCode(Signup registrationUser, String code);
}
