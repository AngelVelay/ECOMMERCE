import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:jexpoints/app/core/utils/msg.utils.dart';
import 'package:jexpoints/app/modules/auth/entities/user-data.type.dart';
import '../../auth.module.dart';
import '../../services/auth/auth.contract.dart';
import '../../entities/signup.type.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  late IAuthService _authService;
  var isLoading = false.obs;
  bool isValidating = false;
  String successMessage = '';
  String registrationCode = '';
  String validationCode = '';
  UserData userData =
      UserData(id: '', password: '', passwordSalt: '', username: '');

  SignupController(IAuthService authService) {
    _authService = authService;
  }

  signUpStepOne() async {
    if (isLoading.value) return;

    isLoading.value = true;
    formKey.currentState?.save();
    _authService.signup = Signup(
      email: formKey.currentState?.value['email'],
      name: formKey.currentState?.value['name'],
      phone: int.parse(formKey.currentState?.value['phone']),
    );
    var singupResponse =
        await _authService.signUp().whenComplete(() => isLoading.value = false);

    if (singupResponse == null) {
      MsgUtils.error('No se pudo enviar el código de verificación.');
      return;
    }

    _authService.signup!.registrationCode = singupResponse.registrationCode;
    Get.toNamed(AuthRouting.VERIFICATION_ROUTE);
  }
}
