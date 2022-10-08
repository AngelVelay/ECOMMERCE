import '../../entities/qrCode.type.dart';

abstract class IQrCodesService {
  Future<QrCode> generate(int type);
}
