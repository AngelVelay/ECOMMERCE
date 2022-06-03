import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:jexpoints/app/core/utils/msg.utils.dart';
import 'package:jexpoints/app/modules/auth/views/verification/verification.controller.dart';
import '../../auth.module.dart';
import '../../services/auth/auth.contract.dart';
import '../../entities/signup.type.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  late IAuthService _authService;

  SignupController(IAuthService authService) {
    _authService = authService;
  }

  @override
  void onInit() {
    super.onInit();
  }

  send() async {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      var signupUser = Signup.fromJson(formKey.currentState!.value);
      await _authService.signUp(signupUser);
      // var _verificationController =
      //     Get.put(VerificationController(_authService));
      // _verificationController.phoneNumber = signupUser.phoneNumber;
      Get.toNamed(AuthRouting.VERIFICATION_ROUTE);
    } else {
      MsgUtils.error('Verifique los campos');
    }
  }
}
