import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/core/utils/msg.utils.dart';
import 'package:jexpoints/app/modules/auth/auth.module.dart';
import '../../services/auth/auth.contract.dart';

class PasswordController extends GetxController {
  final IAuthService _authService;
  final formKey = GlobalKey<FormState>(debugLabel: 'password');
  TextEditingController passwordTextCtrl = TextEditingController();
  TextEditingController confirmPasswordTextCtrl = TextEditingController();

  PasswordController(this._authService);

  @override
  void onInit() {
    super.onInit();
  }

  save() {
    if (confirmValidate() == null) {
      Get.toNamed(AuthRouting.SIGNUP_SUCCESS_ROUTE);
    }
  }

  String? confirmValidate() {
    if (confirmPasswordTextCtrl.text.isEmpty) {
      return 'Campo requerido';
    }
    if (confirmPasswordTextCtrl.text != passwordTextCtrl.text) {
      return 'Las contraseñas no coinciden!';
    }

    return null;
  }
}
