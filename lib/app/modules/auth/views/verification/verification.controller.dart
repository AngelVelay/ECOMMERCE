import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/core/utils/msg.utils.dart';
import 'package:jexpoints/app/modules/auth/auth.module.dart';
import 'package:jexpoints/app/modules/main/main.module.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../services/auth/auth.contract.dart';

class VerificationController extends GetxController {
  late IAuthService _authService;

  var phoneNumber = '';
  final formKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType>? errorController;
  TextEditingController textEditingController = TextEditingController();
  bool hasError = false;
  String currentText = "";

  VerificationController(IAuthService authService) {
    _authService = authService;
    textEditingController = TextEditingController();
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void onInit() {
    phoneNumber = _authService.user!.phoneNumber!;
    super.onInit();
  }

  validate() async {
    currentText = textEditingController.text;
    formKey.currentState!.validate();
    var validatedUser =
        await _authService.validateCode(_authService.user!, currentText);
    if (currentText.length != 5 || validatedUser == null) {
      errorController!.add(ErrorAnimationType.shake);
      hasError = true;
      clear();
    } else {
      hasError = false;
      Get.toNamed(AuthRouting.VERIFICATION_SUCCESS_ROUTE);
    }
  }

  clear() {
    textEditingController.clear();
  }

  resend() {
    MsgUtils.success("Se ha vuelto a enviar el codigo de verificación.",
        title: 'Código reenviado');
    textEditingController.clear();
  }

  goToHome(){
    Get.toNamed(MainRouting.HOME_ROUTE);
  }
}
