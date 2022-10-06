import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/core/utils/msg.utils.dart';
import 'package:jexpoints/app/modules/auth/auth.module.dart';
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

  final passwordFormKey = GlobalKey<FormState>();

  VerificationController(IAuthService authService) {
    _authService = authService;
    textEditingController = TextEditingController();
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void onInit() {
    if (_authService.signup != null) {
      phoneNumber = _authService.signup!.email.toString();
    }
    super.onInit();
  }

  signUpStepTwo() async {
    _authService.signup!.validationCode = textEditingController.text;
    await _authService.signUp().then((value) {
      hasError = false;
      Get.toNamed(AuthRouting.PASSWORD_ROUTE);
    }).onError((error, stackTrace) {
      errorController!.add(ErrorAnimationType.shake);
      hasError = true;
      clear();
    });
  }

  clear() {
    textEditingController.clear();
  }

  resend() async {
    _authService.signup!.validationCode = null;
    await _authService.signUp();
    MsgUtils.success('El código ha sido reenviado.');
    // textEditingController.clear();
  }

  onTextChange(String code) {
    if (code.length < 5) return;

    signUpStepTwo();
  }
}
