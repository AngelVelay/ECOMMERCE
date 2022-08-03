import 'package:jexpoints/app/modules/main/entities/business-line.type.dart';
import 'package:jexpoints/app/modules/main/services/business-lines/business-lines.contract.dart';

class BusinessLinesFakeService implements IBusinessLinesService {
  final _list = <BusinessLine>[
    BusinessLine(
      id: '1',
      name: 'Esperanza',
      isActive: true,
    ),
    BusinessLine(
      id: '2',
      name: 'Santo Gallo',
      isActive: true,
    ),
  ];

  @override
  Future<List<BusinessLine>> get() async {
    return _list;
  }
}
