import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jexpoints/app/modules/main/entities/ubications.type.dart';
import 'package:http/http.dart' as http;

import '../../entities/sucursal-type.dart';
import '../ubications/utills/map_utils.dart';

class UbicationsListController extends GetxController {
  @override
  void onInit() {
    getBranches();
    super.onInit();
  }

  var reports$ = <dynamic>[].obs;
  var isLoading = false.obs;

  getBranches() async {
    isLoading.value = true;
    var response = await fetchPost();
    reports$.value =
        response.map((json) => UbicationsObject.fromJson(json)).toList();
    isLoading.value = false;
  }

  Future<dynamic> fetchPost() async {
    final response = await http.get(
      Uri.parse(
          'http://dev.jexbit.mx/JexcoreService/api/OrganizationsApplicationsKeys/db755596-ed44-417b-9a5a-8512964932a8/branches'),
    );
    return json.decode(response.body);
  }
}
