import 'dart:convert';

import 'package:jexpoints/app/core/data/entities/request_method.enum.dart';
import 'package:jexpoints/app/core/data/providers/api.provider.dart';
import 'package:jexpoints/app/modules/main/entities/business-line.type.dart';
import 'package:jexpoints/app/modules/main/services/business-lines/business-lines.contract.dart';

class BusinessLinesApiService implements IBusinessLinesService {
  final String apiMethod = "BusinessLines";
  final provider = ApiProvider.instance;

  @override
  Future<List<BusinessLine>> get() async {
    var jsonResponse = await provider.request(RequestMethod.get, apiMethod);
    return jsonDecode(jsonResponse)
        .cast<Map<String, dynamic>>()
        .map<BusinessLine>((x) => BusinessLine.fromJson(x))
        .toList();
  }
}
