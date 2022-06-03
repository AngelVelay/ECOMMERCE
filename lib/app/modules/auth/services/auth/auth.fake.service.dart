import 'package:flutter/cupertino.dart';
import 'package:jexpoints/app/core/data/services/base-service.service.dart';
import 'package:jexpoints/app/core/utils/msg.utils.dart';
import 'package:jexpoints/app/modules/auth/entities/branch.type.dart';
import 'package:jexpoints/app/modules/auth/entities/signup.type.dart';
import '../../entities/user.type.dart';
import 'auth.contract.dart';

class AuthFakeService extends BaseService implements IAuthService {
  final _users = [
    User(
        organizationId: '',
        isActive: true,
        username: 'jcarballido@jexbit.mx',
        passwordSalt: '',
        id: 1)
  ];

  AuthFakeService() : super('');

  @override
  Future<User?> singIn(String username, String password) async {
    var usersFinded = _users.where((e) => e.username == username);
    if (usersFinded.length > 0) {
      return usersFinded.first;
    } else {
      return null;
    }
  }

  @override
  Future<User?> checkUser() async {
    return _users.first;
  }

  @override
  Future<List<Branch>> getDummyList() {
    // TODO: implement getBranches
    throw UnimplementedError();
  }

  @override
  User? user;

  @override
  Future<User?> signUp(Signup registrationUser) async {
    user = User(
        organizationId: '',
        isActive: true,
        username: registrationUser.email,
        passwordSalt: '',
        phoneNumber: registrationUser.phoneNumber, 
        id: 0);
    user?.code = '12345';
    return user;
  }

  @override
  Future<User?> validateCode(User registrationUser, String code) async {
    if (registrationUser.code != code) {
      MsgUtils.error("Código inválido");
      return null;
    }
    return registrationUser;
  }
}
