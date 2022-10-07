import 'dart:ffi';

import 'package:jexpoints/app/modules/main/entities/product.type.dart';

import '../../entities/qrCode.type.dart';

abstract class IQrCodesService {
  Future<QrCode> generate(int type);
}
