import 'package:jexpoints/app/core/data/providers/api_exceptions.dart';
import 'package:jexpoints/app/core/utils/msg.utils.dart';
import 'package:jexpoints/app/core/utils/storage.utils.dart';
import 'package:jexpoints/app/modules/auth/entities/api-error.type.dart';
import 'package:jexpoints/app/modules/auth/entities/security_token.type.dart';
import 'package:jexpoints/app/modules/auth/entities/signin.type.dart';
import 'package:jexpoints/app/modules/auth/entities/signup.type.dart';
import 'package:jexpoints/app/modules/auth/entities/user-data.type.dart';
import 'package:jexpoints/app/shared/values/enviroments.dart';
import 'package:jexpoints/app/core/data/services/base-service.service.dart';
import 'package:jexpoints/app/shared/values/globals.dart';
import '../../entities/user.type.dart';
import 'auth.contract.dart';

class AuthApiService extends BaseService implements IAuthService {
  final String authUrl = Enviroments.AUTH_API_URL;

  AuthApiService() : super(apiMethod: "Auth", url: Enviroments.AUTH_API_URL);

  @override
  User? user;

  @override
  Future<String?> singIn(String username, String password) async {
    var result = "";
    try {
      // Get Token
      var tokenString = await post(
          Signin(username: username, password: password),
          urlComplement: 'signin',
          useCustomUrl: false);
      var token = SecurityToken.fromRawJson(tokenString);
      LocalStorageUtils.setStringKey(Globals.TOKEN_KEY, token.accessToken);

      // Set User Data to local storage
      var userJson = await get('UserData/current', useCustomUrl: true);
      LocalStorageUtils.setStringKey(Globals.CURRENT_USER_KEY, userJson);
    } on BadRequestException catch (ex) {
      var apiEx = ApiException.fromRawJson(
          ex.toString().replaceAll("Invalid Request: ", ""));
      if (apiEx.exceptionType == "AppValidationException") {
        result = apiEx.message;
      } else {
        result = "Algo salió mal, comunicate con el administrador";
      }
    } on Error catch (ex) {
      result = "Algo salió mal, comunicate con el administrador";
    }

    return result;
  }

  @override
  Future<UserData?> checkUser() async {
    try {
      var userJson =
          await LocalStorageUtils.getStringByKey(Globals.CURRENT_USER_KEY);
      if (userJson.isEmpty) {
        return null;
      } else {
        return UserData.fromRawJson(userJson);
      }
    } catch (ex) {
      print(ex.toString());
      return null;
    }
  }

  @override
  Future<Signup?> signUp() async {
    if (signup == null) {
      MsgUtils.error(
          "Error al obtener datos de registro, verifique con el administrador");
      return null;
    }

    try {
      var jsonResult = await post(signup!, urlComplement: 'signup');
      return Signup.fromRawJson(jsonResult);
    } on BadRequestException catch (ex) {
      return null;
    } on Error catch (ex) {
      return null;
    }
  }

  @override
  Signup? signup;
}
