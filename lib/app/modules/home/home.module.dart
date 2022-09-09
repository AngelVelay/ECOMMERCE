// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.contract.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.fake.service.dart';
import 'package:jexpoints/app/modules/cart/views/address-detail/address-detail.controller.dart';
import 'package:jexpoints/app/modules/home/services/address/address.api.service.dart';
import 'package:jexpoints/app/modules/home/services/address/address.contract.dart';
import 'package:jexpoints/app/modules/home/views/address/address.controller.dart';
import 'package:jexpoints/app/modules/home/views/address/address.page.dart';

import 'package:jexpoints/app/modules/home/views/detail-delivery/detail-delivery.controller.dart';
import 'package:jexpoints/app/modules/home/views/details/detail.controller.dart';
import 'package:jexpoints/app/modules/home/views/details/detail.page.dart';
import 'package:jexpoints/app/modules/home/views/publicidad_detail/publicidad.controller.dart';
import 'package:jexpoints/app/modules/home/views/publicidad_detail/publicidad.page.dart';
import 'package:jexpoints/app/modules/main/services/products/products.fake.service.dart';
import 'package:jexpoints/app/modules/main/services/reviews/reviews.fake.service.dart';

import '../cart/views/address-detail/address-detail.page.dart';
import '../main/services/address/address.fake.service.dart';
import 'views/detail-delivery/detail-delivery.page.dart';

class HomeRouting {
  static const ADDRESS_ROUTE = '/address';
  static const DETAIL_ROUTE = '/detail';
  static const PUBLICIDAD_ROUTE = '/publicidad';
  static const ADDRESS_DETAIL_ROUTE = '/address-detail';
  static const DELIVERY_DETAIL = '/delivery-detail';

  static final IAuthService authService = AuthFakeService();
  static final IAddressService addressService = AddressService();

  static final routes = [
    GetPage(
        name: ADDRESS_ROUTE,
        page: () => AddressPage(),
        binding: AddressBinding()),
    GetPage(
      name: DETAIL_ROUTE,
      page: () => DetailPage(),
      binding: DetailBinding(),
    ),
    GetPage(
        name: PUBLICIDAD_ROUTE,
        page: () => PublicidadPage(),
        binding: PublicidadBinding()),
    GetPage(
        name: ADDRESS_DETAIL_ROUTE,
        page: () => const AddressDetailPage(),
        binding: AddressDetailBinding()),
    GetPage(
        name: DELIVERY_DETAIL,
        page: () => const DeliveryDetailPage(),
        binding: DeliveryDetailBinding()),
  ];
}

class AddressBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressController>(() => AddressController(AddressService()));
  }
}

class DetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(
      () => DetailController(ReviewsFakeService(), ProductsFakeService()),
    );
  }
}

class PublicidadBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PublicidadController>(() => PublicidadController());
  }
}

class AddressDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressDetailController>(
        () => AddressDetailController(AddressFakeService()));
  }
}

class DeliveryDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailDeliveryController>(() => DetailDeliveryController());
  }
}
