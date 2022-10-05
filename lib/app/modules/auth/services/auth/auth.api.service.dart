import 'dart:convert';

import 'package:jexpoints/app/core/data/entities/request_method.enum.dart';
import 'package:jexpoints/app/core/utils/msg.utils.dart';
import 'package:jexpoints/app/core/utils/storage.utils.dart';
import 'package:jexpoints/app/modules/auth/entities/branch.type.dart';
import 'package:jexpoints/app/modules/auth/entities/membership.type.dart';
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

  AuthApiService() : super(apiMethod: "Auth", url: Enviroments.AUTH_API_URL);

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
  Future<dynamic> signUp(Signup registrationUser) async {
    try {
      var json = await post(registrationUser, urlComplement: 'auth/signup');
      return jsonDecode(json);
    } catch (ex) {
      return ex;
    }
    // return provider.request<Signup>(
    //   RequestMethod.post,
    //   'auth/signup',
    //   body: registrationUser.toJson() as Signup,
    // );
  }

  @override
  Future<Signup?> validateCode(Signup registrationUser, String code) {
    if (registrationUser.registrationCode != code) {
      MsgUtils.error("Código inválido");
      return Future.value(null);
    }
    return registrationUser as Future<Signup?>;
  }
}

  // var jsonResponse = await provider.request<List<PaymentMethods>>(
  //       RequestMethod.post, 'UserPaymentMethods',
  //       body: json.encode(creditCard));

  //   var result = jsonDecode(jsonResponse);
  //   return PaymentMethods.fromJson(result);
  // }

  // @override
  // Future<User?> signUp(Signup registrationUser) async {
  //   user = User.fromVoid();
  //   user?.code = '12345';
  //   return user;
  // }

  // @override
  // Future<Signup> validateCode(Signup registrationUser, String code) async {
  //   if (registrationUser.registrationCode != code) {
  //     MsgUtils.error("Código inválido");
  //     return null;
  //   }
  //   return registrationUser as Signup;
  // }






// signupStepOne() {    
//     this.isLoading = true;
//     this.errorMessage = '';    
//     this._authService
//         .signUp(this.usersForm.value)
//         .then(response => {                    
//           this.usersForm.get('registrationCode')?.setValue(response.registrationCode);
//           this.modalValidationBtn?.nativeElement.click();
//         }) 
//         .catch(errorResponse => this._handleError(errorResponse))
//         .finally(() => this.isLoading = false);

//   }

//   signupStepTwo(){
//     this.errorMessage = '';    
//     this.ngOtpInputRef.otpForm.disable();
//     this.isValidating = true;
//     this._authService
//         .signUp(this.usersForm.value)        
//         .then(response => {     
//           this.isVisible = true;
//           this.title = 'Ingresa tu contraseña';          
//           this.modalValidateCloseBtn?.nativeElement.click();
//         })
//         .catch(errorResponse => {
//           this._handleError(errorResponse);          
//           this.ngOtpInputRef.setValue(''); 
//           setTimeout(() => {
//             this.errorMessage = '';
//           }, 2000);
//         })
//         .finally(() => {
//           this.ngOtpInputRef.otpForm.enable();
//           this.isValidating = false;          
//         });
//   }

//   signupStepThree(){
//     this.errorMessage = '';    
//     this.usersForm.get('password')?.setValue(
//       this.passwordForm.get('password')?.value
//     );    
//     this._authService
//         .signUp(this.usersForm.value)
//         .then((response: Signup) => {          
//           this.successMessage = `!Felicidades ${response.userData.name}(${response.userData.user.username}) has realizado con exito tu registro!`;
//           this.modalSigninComplete?.nativeElement.click();
//         })
//         .catch(errorResponse => this._handleError(errorResponse));
//   }