import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/core/utils/msg.utils.dart';
import '../../auth.module.dart';
import '../../services/user/user.contract.dart';

class RecoveryPasswordController extends GetxController {
  final IUserService _repo;
  var email = TextEditingController();

  RecoveryPasswordController(this._repo);

  send() async {
    _repo.recoveryPassword(email.text);
    MsgUtils.success(
        'Se ha enviado un correo electronico, siga los pasos para resetear su contraseña');
    Get.toNamed(AuthRouting.LOGIN_ROUTE);
  }
}
