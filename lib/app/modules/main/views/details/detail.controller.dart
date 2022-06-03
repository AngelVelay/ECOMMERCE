import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DetailController extends GetxController {
  final imageUrl = Get.arguments['url'];
  final name = Get.arguments['name'];
  final points = Get.arguments['points'];
}
