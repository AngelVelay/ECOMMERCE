import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jexpoints/app/core/utils/msg.utils.dart';
import 'package:jexpoints/app/modules/auth/auth.module.dart';
import '../../services/auth/auth.contract.dart';

class PasswordController extends GetxController {
  final IAuthService _authService;
  final formKey = GlobalKey<FormState>(debugLabel: 'password');
  TextEditingController passwordTextCtrl = TextEditingController();
  TextEditingController confirmPasswordTextCtrl = TextEditingController();
  late String? _birthdate;
  final valueFormat = DateFormat("yyyy-MM-dd");
  var isLoading = false.obs;

  PasswordController(this._authService);

  signUpStepThree() async {
    if (isLoading.value) return;

    if (confirmValidate() != null) return;
    isLoading.value = true;
    _authService.signup!.password = passwordTextCtrl.text;
    _authService.signup!.birthdate = _birthdate;

    await _authService.signUp().then((value) {
      // TODO: Add UserData
      Get.toNamed(AuthRouting.SIGNUP_SUCCESS_ROUTE);
    }).onError((error, stackTrace) {
      MsgUtils.error(
          'Ocurrió un error al enviar tus datos, por favor reintenta');
    }).whenComplete(() => isLoading.value = false);
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

  onBirthdateChange(value) {
    _birthdate = valueFormat.format(value);
  }
}
