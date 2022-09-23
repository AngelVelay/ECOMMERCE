import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:jexpoints/app/shared/values/enviroments.dart';
import 'package:share_plus/share_plus.dart';

class PublicidadController extends GetxController {
  final postersImage$ = ''.obs;
  var item = Get.arguments;

  @override
  void onInit() async {
    var item = Get.arguments;

    postersImage$.value = await imagePoster();

    super.onInit();
  }

  Future imagePoster() async {
    var item = Get.arguments;

    var imageUrl = Enviroments.FILE_MANAGER_URL +
        "Files/" +
        Enviroments.FILE_MANAGER_KEY +
        "/" +
        item[3].toString();

    var response = await http.get(Uri.parse(imageUrl));

    Map<String, dynamic> responseJson = await jsonDecode(response.body);

    var result = responseJson['fileLink'].toString();

    return result;
  }

  shareData() async {
    var item = Get.arguments;

    await Share.share(item.toString(), subject: 'Compartir Publicidad');
  }
}
