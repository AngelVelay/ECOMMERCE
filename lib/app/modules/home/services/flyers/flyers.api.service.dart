// import 'dart:convert';

// import '../../../../core/data/entities/request_method.enum.dart';
// import '../../../../core/data/services/base-service.service.dart';
// import '../../../../shared/values/enviroments.dart';
// import '../../entities/flyer.type.dart';
// import 'flyers.contract.dart';

// class FlyersApiService extends BaseService implements IFlyersService {
//   FlyersApiService() : super(apiMethod: 'Flyers', url: Enviroments.API_URL);

//   @override
//   Future<List<Flyer>> getAll() async {
//     var jsonResponse = await provider.request<List<Flyer>>(
//         RequestMethod.get, 'Banners');

//     var result = jsonDecode(jsonResponse)
//         .cast<Map<String, dynamic>>()
//         .map<Flyer>((x) => Flyer.fromJson(x))
//         .toList() as List<Flyer>;

  

//     return result;
//   }
// }
