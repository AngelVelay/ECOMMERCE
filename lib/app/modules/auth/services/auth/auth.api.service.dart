import 'dart:convert';

import 'package:jexpoints/app/core/utils/msg.utils.dart';
import 'package:jexpoints/app/core/utils/storage.utils.dart';
import 'package:jexpoints/app/modules/auth/entities/branch.type.dart';
import 'package:jexpoints/app/modules/auth/entities/security_token.type.dart';
import 'package:jexpoints/app/modules/auth/entities/signin.type.dart';
import 'package:jexpoints/app/modules/auth/entities/signup.type.dart';
import 'package:jexpoints/app/modules/auth/entities/token_reponse.type.dart';
import 'package:jexpoints/app/shared/values/enviroments.dart';
import 'package:jexpoints/app/core/data/services/base-service.service.dart';
import 'package:jexpoints/app/shared/values/globals.dart';
import '../../entities/user.type.dart';
import 'auth.contract.dart';

class AuthApiService extends BaseService implements IAuthService {
  final String authUrl = Enviroments.AUTH_API_URL;

  AuthApiService() : super("Auth", url: Enviroments.AUTH_API_URL);

  @override
  User? user;

  @override
  Future<User?> singIn(String username, String password) async {
    try {
      // Get Token
      var tokenString = await post(
          Signin(username: username, password: password),
          urlComplement: 'signin');
      var token = SecurityToken.fromRawJson(tokenString);
      LocalStorageUtils.setStringKey(Globals.TOKEN_KEY, token.accessToken);

      // Get User Data
      var userJson = await get('Users/current', useCustomUrl: true);
      LocalStorageUtils.setStringKey(Globals.CURRENT_USER_KEY, userJson);
      var result = User.fromRawJson(userJson);
      return result;
    } catch (ex) {
      return null;
    }
  }

  @override
  Future<User?> checkUser() async {
    try {
      var userJson =
          await LocalStorageUtils.getStringByKey(Globals.CURRENT_USER_KEY);
      if (userJson.isEmpty) {
        return null;
      } else {
        return User.fromRawJson(userJson);
      }
    } catch (ex) {
      return null;
    }
  }

  @override
  Future<List<Branch>> getDummyList() async {
    try {
      var json = await get(
          'OrganizationsApplicationsKeys/68B190F5-2A7A-490A-B120-15800C6C8AC2/branches',
          useCustomUrl: true);
      return jsonDecode(json)
          .cast<Map<String, dynamic>>()
          .map<Branch>((x) => Branch.fromJson(x))
          .toList();
    } catch (ex) {
      return [];
    }
  }

  @override
  Future<User?> signUp(Signup registrationUser) async {
    user = User(
        organizationId: '',
        isActive: true,
        username: registrationUser.email,
        passwordSalt: '',
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
