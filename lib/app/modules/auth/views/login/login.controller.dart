import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jexpoints/app/core/utils/msg.utils.dart';
import 'package:jexpoints/app/modules/auth/auth.module.dart';
import 'package:jexpoints/app/modules/auth/entities/user.type.dart';
import 'package:jexpoints/app/modules/main/main.module.dart';
import 'package:jexpoints/app/shared/values/enviroments.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../services/auth/auth.contract.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class LoginController extends GetxController {
  late IAuthService _service;
  var loginText = 'Ingresar'.obs;
  var username = TextEditingController(text: 'jcarballido@jexbit.mx');
  var password = TextEditingController(text: 'Abcd1234');
  Map<String, dynamic> resultGoogle = {};
  final LocalAuthentication localAuthentication = LocalAuthentication();
  static final _googleSignIn = GoogleSignIn(
    //clientId: Enviroments.GOOGLE_CLIENT_ID,
    signInOption: SignInOption.standard,
    scopes: [
      'email',
      'profile',
    ],
  );

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();

  LoginController(IAuthService service) {
    _service = service;
    _checkLogueInUser();
  }

  @override
  void onInit() {
    super.onInit();
  }

  singIn() async {
    loginText.value = 'Ingresando...';
    var user = await _service.singIn(username.text, password.text);
    loginText.value = 'Ingresar';
    if (user != null) {
      Get.toNamed(MainRouting.HOME_ROUTE);
    } else {
      MsgUtils.error('Algo salio mal');
    }
  }

  _checkLogueInUser() async {
    var currentUser = await _service.checkUser();
    if (currentUser != null && currentUser.id != 0) {
      Get.toNamed(MainRouting.HOME_ROUTE);
    }
  }

  goToSignup() {
    Get.toNamed(AuthRouting.SIGNUP_ROUTE);
  }

  signInGoogleAuth() async {
    try {
      final result = await _googleSignIn.signIn();
      if (result != null) {
        Get.toNamed(MainRouting.HOME_ROUTE);
        print(result);
      }
    } catch (error) {
      print(error);
    }
  }

  signInFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      Get.toNamed(MainRouting.HOME_ROUTE);

      print(accessToken.toJson());
    } else {
      print(result.status);
      print(result.message);
    }
  }

  signInApple() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    print(credential);
  }

  Future<dynamic> faceID() async {
    final LocalAuthentication localAuthentication = LocalAuthentication();
    bool isBiometricSupported = await localAuthentication.isDeviceSupported();
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    bool isAuthenticated = false;

    if (isBiometricSupported && canCheckBiometrics) {
      isAuthenticated = await localAuthentication.authenticate(
          localizedReason: 'FaceID',
          options: const AuthenticationOptions(biometricOnly: true));
    }

    if (isAuthenticated) {
      Get.toNamed(MainRouting.HOME_ROUTE);
    } else {
      IOSAuthMessages(
        lockOut: 'Ingresa con Face ID',
        cancelButton: 'Cancelar',
      );
    }
  }
}
