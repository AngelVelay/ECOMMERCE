import 'dart:convert';

import 'package:jexpoints/app/core/data/entities/request_method.enum.dart';
import 'package:jexpoints/app/core/data/services/base-service.contract.dart';

import '../providers/api.provider.dart';

class BaseService extends IBaseService {
  final provider = ApiProvider.instance;
  late String _apiMethod;
  late String? _url;

  BaseService(String apiMethod, {String? url}) {
    _apiMethod = apiMethod;
    _url = url;
  }

  @override
  Future<String> get<T>(String urlComplement, {bool useCustomUrl = false}) {
    return provider.request(
        RequestMethod.get, _solveUrl(urlComplement, useCustomUrl));
  }

  @override
  Future<String> post(Object item,
      {String urlComplement = '', bool useCustomUrl = false}) {
    return provider.request(
        RequestMethod.post, _solveUrl(urlComplement, useCustomUrl),
        useDefaultUrl: !(_url != null && _url != ''), body: json.encode(item));
  }

  @override
  Future<String> delete(int id) {
    var finalUrl = _solveUrl('', false) + '/$id';
    return provider.request(RequestMethod.delete, finalUrl,
        useDefaultUrl: !(_url != null && _url != ''));
  }

  String _solveUrl(String urlComplement, bool useCustomUrl) {
    String result = "";
    result = (_url != null && _url != '') ? _url! : '';

    result = useCustomUrl
        ? '$result$urlComplement'
        : '$result$_apiMethod/$urlComplement';
    return result;
  }
}
