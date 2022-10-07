// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.contract.dart';
import 'package:jexpoints/app/modules/cart/views/address-detail/address-detail.controller.dart';
import 'package:jexpoints/app/modules/home/services/address/address.api.service.dart';
import 'package:jexpoints/app/modules/home/services/address/address.contract.dart';
import 'package:jexpoints/app/modules/home/services/products/products.api.service.dart';
import 'package:jexpoints/app/modules/home/services/qr-codes/qr-codes.api.service.dart';
import 'package:jexpoints/app/modules/home/views/address/address.controller.dart';
import 'package:jexpoints/app/modules/home/views/address/address.page.dart';

import 'package:jexpoints/app/modules/home/views/detail-delivery/detail-delivery.controller.dart';
import 'package:jexpoints/app/modules/home/views/details/components/detailTopProducts.dart';
import 'package:jexpoints/app/modules/home/views/details/detail.controller.dart';
import 'package:jexpoints/app/modules/home/views/qr-generate/generate.qr.controller.dart';
import 'package:jexpoints/app/modules/home/views/qr-generate/generate.qr.page.dart';
import 'package:jexpoints/app/modules/main/services/reviews/reviews.fake.service.dart';

import '../auth/services/auth/auth.api.service.dart';
import '../cart/views/address-detail/address-detail.page.dart';
import 'views/detail-delivery/detail-delivery.page.dart';
import 'views/details_screen/item_details_screen.dart';
import 'views/poster-detail/poster.controller.dart';
import 'views/poster-detail/poster.page.dart';

class HomeRouting {
  static const ADDRESS_ROUTE = '/address';
  static const DETAIL_ROUTE = '/detail';
  static const POSTER_ROUTE = '/poster';
  static const ADDRESS_DETAIL_ROUTE = '/address-detail';
  static const DELIVERY_DETAIL = '/delivery-detail';
  static const TOP_PRODUCTS_DETAIL_ROUTE = '/top-products';
  static const GENERATE_QR_ROUTE = '/generate-qr';

  static final IAuthService authService = AuthApiService();
  static final IAddressService addressService = AddressService();

  static final routes = [
    GetPage(
        name: ADDRESS_ROUTE,
        page: () => AddressPage(),
        binding: AddressBinding()),
    GetPage(
      name: DETAIL_ROUTE,
      page: () => ItemDetailsSreen(),
      binding: DetailBinding(),
    ),
    GetPage(
        name: POSTER_ROUTE,
        page: () => const PosterPage(),
        binding: PosterBinding()),
    GetPage(
        name: ADDRESS_DETAIL_ROUTE,
        page: () => const AddressDetailPage(),
        binding: AddressDetailBinding()),
    GetPage(
        name: DELIVERY_DETAIL,
        page: () => const DeliveryDetailPage(),
        binding: DeliveryDetailBinding()),
    GetPage(
        name: TOP_PRODUCTS_DETAIL_ROUTE,
        page: () => DetailTopProductsPage(),
        binding: DetailBinding()),
    GetPage(
        name: GENERATE_QR_ROUTE,
        page: () => QrGeneratePage(),
        binding: QrGenerateBinding()),
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
      () => DetailController(ReviewsFakeService(), ProductsApiService()),
    );
  }
}

class PosterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PosterController>(() => PosterController());
  }
}

class AddressDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressDetailController>(
        () => AddressDetailController(AddressService()));
  }
}

class DeliveryDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailDeliveryController>(() => DetailDeliveryController());
  }
}

class QrGenerateBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrGenerateController>(
        () => QrGenerateController(QrCodesApiService()));
  }
}
