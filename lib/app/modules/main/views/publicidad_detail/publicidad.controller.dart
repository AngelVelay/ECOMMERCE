import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:share_plus/share_plus.dart';

class PublicidadController extends GetxController {
  final image = Get.arguments;

  shareData() async {
    await Share.share(image, subject: 'Share');
  }
}
