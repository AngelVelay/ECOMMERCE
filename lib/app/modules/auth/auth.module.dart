// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:get/get.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.contract.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.fake.service.dart';
import 'package:jexpoints/app/modules/auth/views/splash/splash-screen.dart';
import 'package:jexpoints/app/modules/auth/views/verification-success/verification-success.page.dart';
import 'package:jexpoints/app/modules/auth/views/verification/verification.controller.dart';
import 'services/auth/auth.api.service.dart';
import 'services/user/user.api.service.dart';
import 'views/login/login.controller.dart';
import 'views/login/login.page.dart';
import 'views/recovery/recovery.controller.dart';
import 'views/signup/signup.controller.dart';
import 'views/signup/signup.page.dart';
import 'views/verification/verification.page.dart';

class AuthRouting {
  static const LOGIN_ROUTE = '/login';
  static const SIGNUP_ROUTE = '/signup';
  static const VERIFICATION_ROUTE = '/verification';
  static const VERIFICATION_SUCCESS_ROUTE = '/verification-success';
  static const SPLASH_ROUTE = '/splash';

  static final IAuthService authService = AuthFakeService();

  static final routes = [
    GetPage(name: LOGIN_ROUTE, page: () => LoginPage(), binding: AuthBinding()),
    GetPage(name: SIGNUP_ROUTE, page: () => SignupPage()),
    GetPage(name: VERIFICATION_ROUTE, page: () => VerificationPage()),
    GetPage(name: SPLASH_ROUTE, page: () => const SplashPage()),
    GetPage(name: VERIFICATION_SUCCESS_ROUTE, page: () => VerificationSuccessPage()),
  ];
}

class AuthBinding implements Bindings {
  final IAuthService authService = AuthFakeService();

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(AuthApiService()));
    Get.lazyPut<RecoveryPasswordController>(
        () => RecoveryPasswordController(UserApiService()));
    Get.lazyPut<SignupController>(() => SignupController(authService),
        fenix: true);
    Get.lazyPut<VerificationController>(
        () => VerificationController(authService),
        fenix: true);
  }
}
