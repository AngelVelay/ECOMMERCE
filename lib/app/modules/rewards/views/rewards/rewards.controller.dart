import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/core/utils/storage.utils.dart';
import 'package:jexpoints/app/modules/main/main.module.dart';
import 'package:jexpoints/app/shared/values/globals.dart';

import '../../../auth/auth.module.dart';
import '../../../auth/entities/user.type.dart';
import '../../../auth/services/auth/auth.contract.dart';
import '../../../cart/cart.module.dart';
import '../../../home/home.module.dart';
import '../../rewards.module.dart';

class Menu {
  IconData icon;
  String route;
  String label;

  Menu(this.icon, this.route, this.label);
}

class RewardsController extends GetxController {
  final IAuthService _repo;

  var user$ = User.fromVoid().obs;
  List<Menu> menuItems = [
    Menu(Icons.shopping_basket, RewardsRouting.CONSUME_ROUTE, 'Compras'),
    Menu(Icons.card_membership, CartRouting.PAYMENT_METHODS_ROUTE, 'Pagos'),
    Menu(Icons.home, HomeRouting.ADDRESS_ROUTE, 'Domicilios'),
    Menu(Icons.person_outline, AuthRouting.USER_DETAILS_ROUTE, 'Datos'),
    Menu(Icons.article_outlined, RewardsRouting.TERMS_ROUTE, 'Legales'),
    Menu(Icons.fact_check_outlined, MainRouting.BILLING_ROUTE, 'Facturas'),
  ];

  RewardsController(this._repo);

  @override
  void onInit() async {
    _curretUser();
    super.onInit();
  }

  singInOut() {
    LocalStorageUtils.setStringKey(Globals.CURRENT_USER_KEY, '');
    Get.toNamed(AuthRouting.LOGIN_ROUTE);
  }

  _curretUser() async {
    var existingUser = await _repo.checkUser();
    if (existingUser != null) {
      user$.value = existingUser;
    } else {
      Get.toNamed(AuthRouting.LOGIN_ROUTE);
    }
  }

  toRoute(String route) {
    Get.toNamed(route);
  }

  toUserDetails() {
    Get.toNamed(AuthRouting.USER_DETAILS_ROUTE);
  }
}
