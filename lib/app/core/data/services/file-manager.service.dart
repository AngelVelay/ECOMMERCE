import 'package:jexpoints/app/core/data/entities/file-object.type.dart';
import 'package:jexpoints/app/core/data/entities/request_method.enum.dart';
import 'package:jexpoints/app/shared/values/enviroments.dart';
import '../providers/api.provider.dart';

class FileManagerService {
  final provider = ApiProvider.instance;
  final String? _apiMethod = 'Files';
  final String? _url = Enviroments.FILE_MANAGER_URL;

  FileManagerService();

  Future<FileObject> getById(String id) async {
    var jsonResult = await provider.request(RequestMethod.get,
        '$_url$_apiMethod/${Enviroments.FILE_MANAGER_KEY}/$id',
        useDefaultUrl: false);
    var file = FileObject.fromRawJson(jsonResult);
    return file;
  }
}
