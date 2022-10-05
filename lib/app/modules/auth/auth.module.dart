// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.contract.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.fake.service.dart';
import 'package:jexpoints/app/modules/auth/views/password/password.page.dart';
import 'package:jexpoints/app/modules/auth/views/singup-success/signup-success.page.dart';
import 'package:jexpoints/app/modules/auth/views/splash/splash-screen.dart';
import 'package:jexpoints/app/modules/auth/views/verification/verification.controller.dart';
import 'services/auth/auth.api.service.dart';
import 'services/user/user.api.service.dart';
import 'views/login/login.controller.dart';
import 'views/login/login.page.dart';
import 'views/password/password.controller.dart';
import 'views/recovery/recovery.controller.dart';
import 'views/signup/signup.controller.dart';
import 'views/signup/signup.page.dart';
import 'views/user-detail/user-detail.controller.dart';
import 'views/user-detail/user-detail.page.dart';
import 'views/verification/verification.page.dart';

class AuthRouting {
  static const LOGIN_ROUTE = '/login';
  static const SIGNUP_ROUTE = '/signup';
  static const VERIFICATION_ROUTE = '/verification';
  static const SIGNUP_SUCCESS_ROUTE = '/signup-success';
  static const SPLASH_ROUTE = '/splash';
  static const PASSWORD_ROUTE = '/password';
  static const USER_DETAILS_ROUTE = '/user-details';

  static final IAuthService authService = AuthApiService();

  static final routes = [
    GetPage(name: LOGIN_ROUTE, page: () => LoginPage(), binding: AuthBinding()),
    GetPage(name: SIGNUP_ROUTE, page: () => const SignupPage()),
    GetPage(name: VERIFICATION_ROUTE, page: () => VerificationPage()),
    GetPage(name: SPLASH_ROUTE, page: () => const SplashPage()),
    GetPage(name: SIGNUP_SUCCESS_ROUTE, page: () => const SignupSuccessPage()),
    GetPage(
        name: PASSWORD_ROUTE,
        page: () => const PasswordPage(),
        binding: PasswordBinding()),
    GetPage(
        name: USER_DETAILS_ROUTE,
        page: () => const UserDetailPage(),
        binding: UserDetailsBinding()),
  ];
}

class AuthBinding implements Bindings {
  final IAuthService authService = AuthApiService();

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(authService));
    Get.lazyPut<RecoveryPasswordController>(
        () => RecoveryPasswordController(UserApiService()));
    Get.lazyPut<SignupController>(() => SignupController(authService),
        fenix: true);
    Get.lazyPut<VerificationController>(
        () => VerificationController(authService),
        fenix: true);
  }
}

class PasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordController>(() => PasswordController(AuthApiService()));
  }
}

class UserDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserDetailController>(
        () => UserDetailController(AuthApiService()));
  }
}
