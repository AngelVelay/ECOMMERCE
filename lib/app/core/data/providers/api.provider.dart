import 'dart:async';
import 'dart:convert';
import 'dart:io';

// import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jexpoints/app/core/data/providers/api_exceptions.dart';
import 'package:jexpoints/app/core/utils/msg.utils.dart';
import 'package:jexpoints/app/modules/auth/auth.module.dart';
import 'package:jexpoints/app/shared/values/enviroments.dart';
import 'package:jexpoints/app/shared/values/globals.dart';

import '../../utils/storage.utils.dart';
import '../entities/request_method.enum.dart';

class ApiProvider {
  // Singleton
  ApiProvider._privateConstructor();
  static final ApiProvider _instance = ApiProvider._privateConstructor();
  static ApiProvider get instance => _instance;
  // End Singleton

  Future<String> request<T>(RequestMethod method, String endPoint,
      {bool useDefaultUrl = true, String body = ''}) async {
    http.Response resp;

    final Uri url =
        Uri.parse((useDefaultUrl ? Enviroments.API_URL : '') + endPoint);

    final Map<String, String> headers = <String, String>{};
    headers.putIfAbsent(
        HttpHeaders.contentTypeHeader, () => 'application/json');

    // Get and apply token
    var token = await LocalStorageUtils.getStringByKey(Globals.TOKEN_KEY);
    if (token.isNotEmpty) {
      headers.putIfAbsent(
          HttpHeaders.authorizationHeader, () => 'Bearer ' + token);
    }

    try {
      if (method == RequestMethod.get) {
        resp = await http.get(
          url,
          headers: headers,
        );
      } else if (method == RequestMethod.put) {
        resp = await http.put(
          url,
          headers: headers,
          body: body,
        );
      } else if (method == RequestMethod.post) {
        resp = await http.post(
          url,
          headers: headers,
          body: body,
        );
      } else if (method == RequestMethod.delete) {
        resp = await http.delete(
          url,
          headers: headers,
        );
      } else {
        throw Exception('Otro error');
      }

      return _returnResponse(resp);
    } on TimeoutException catch (e) {
      print('Timeout error $e');
      throw Exception();
    } on SocketException catch (e) {
      print('Socket Error: $e');
      throw Exception();
    } on Error catch (e) {
      print('General Error: $e');
      throw Exception();
    }
  }

  String _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body.toString();
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        LocalStorageUtils.setStringKey(Globals.CURRENT_USER_KEY, '');
        Get.toNamed(AuthRouting.LOGIN_ROUTE);
        throw UnauthorisedException(response.body.toString());
      case 500:
        var errorMessage = '';
        if (response.body.contains('AppValidationException')) {
          errorMessage = response.body
              .substring(response.body.indexOf('AppValidationException:'),
                  response.body.indexOf(" at "))
              .replaceAll('AppValidationException:', '')
              .trim();
        } else {
          errorMessage =
              'Ocurrio un error en la peticion, revisalo con el administrador';
        }
        MsgUtils.error(errorMessage);
        throw Exception(errorMessage);
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
