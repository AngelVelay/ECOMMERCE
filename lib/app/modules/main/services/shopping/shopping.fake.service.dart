import 'package:jexpoints/app/modules/auth/entities/branch.type.dart';
import 'package:jexpoints/app/modules/main/entities/address.type.dart';
import 'package:jexpoints/app/modules/main/entities/order.type.dart';
import 'package:jexpoints/app/modules/main/services/address/address.fake.service.dart';
import 'package:jexpoints/app/modules/main/services/shopping/shopping.contract.dart';
import 'package:jexpoints/app/shared/values/mock-data.dart';

class ShoppingFakeService implements IShoppingService {
  @override
  Future<List<Order>> get() async {
    return MockData.ordersList;
  }

  Future getByDeliveryType() async {
    if (MockData.ordersList.length > 0) {
      return MockData.ordersList
          .where(
              (element) => element.deliveryType == DeliveryType.envioADomicilio)
          .toList();
    }

    Future getByTakeAwayType() async {
      if (MockData.ordersList.length > 0) {
        return MockData.ordersList
            .where((element) =>
                element.deliveryType == DeliveryType.retiroEnTienda)
            .toList();
      }
    }

    Future getByPendingType() async {
      if (MockData.ordersList.length > 0) {
        return MockData.ordersList
            .where(
                (element) => element.orderStatusId == OrderStatusEnum.waiting)
            .toList();
      }
    }

    Future getShoppingbyName(String name) async {
      name = name.toLowerCase();
      var result = MockData.ordersList
          .where((e) => e.name.toLowerCase().contains(name))
          .toList();
      return result;
    }
  }

  @override
  Future<List<Order>> search(String keyword) async {
    keyword = keyword.toLowerCase();
    var result = MockData.ordersList
        .where((e) => e.name.toLowerCase().contains(keyword))
        .toList();
    return result;
  }

  @override
  Future<Order> getById(int id) async {
    var finded = MockData.ordersList.firstWhere((element) => element.id == id);
    finded.deliveredAddress = MockData.addressList.first;
    finded.pickupBranch = Branch(
        externalCode: "201",
        externalId: 201,
        name: "Prueba de sucursal",
        isActive: true,
        isBySystem: false,
        description: "Heroes de Churubusco",
        id: 20);
    finded.paymentMethod = MockData.creditCardList.first;

    return finded;
  }
}
