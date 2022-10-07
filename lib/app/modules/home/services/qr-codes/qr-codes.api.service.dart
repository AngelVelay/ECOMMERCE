import 'package:jexpoints/app/core/data/entities/request_method.enum.dart';
import 'package:jexpoints/app/core/data/providers/api.provider.dart';
import 'package:jexpoints/app/modules/home/entities/qrCode.type.dart';
import 'package:jexpoints/app/modules/home/services/qr-codes/qr-codes.contract.dart';

class QrCodesApiService implements IQrCodesService {
  final _provider = ApiProvider.instance;
  final String _apiMethod = 'UserQrCodes';

  QrCodesApiService();

  @override
  Future<QrCode> generate(int type) async {
    var jsonResponse =
        await _provider.request(RequestMethod.post, '$_apiMethod/$type');
    return QrCode.fromRawJson(jsonResponse);
  }
}
