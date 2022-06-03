import '../providers/api.provider.dart';

abstract class GenericService {
  final provider = ApiProvider.instance;
}
