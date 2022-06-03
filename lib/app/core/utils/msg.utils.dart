import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsgUtils {
  static success(String message, {title = 'Operacion correcta'}) {
    _show(message, title: title);
  }

  static error(String message, {title = 'Error'}) {
    _show(message, title: title);
  }

  static _show(String message, {String title = 'Mensaje'}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.grey[850],
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
    );
  }

  // static _showMessage(String message, {String title = 'Mensaje'}) {
  //   Get.defaultDialog(title: title, middleText: message, actions: [
  //     ElevatedButton(
  //         onPressed: () => Get.back(),
  //         child: Text(
  //           "Aceptar",
  //           style: TextStyle(color: Colors.white),
  //         ),
  //         style: ButtonStyle(
  //             backgroundColor: MaterialStateProperty.all<Color>(Colors.black)))
  //   ]);
  // }

}
