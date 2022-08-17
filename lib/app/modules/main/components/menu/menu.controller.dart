import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/auth/auth.module.dart';
import 'package:jexpoints/app/modules/main/main.module.dart';
import '../../../auth/entities/user.type.dart';
import '../../../auth/services/auth/auth.contract.dart';
import '../../../rewards/rewards.module.dart';
import '../../../ubications/ubications.module.dart';

class MenuItem {
  final IconData icon;
  final String route;
  final String label;
  MenuItem(this.icon, this.route, this.label);
}

class MenuController extends GetxController {
  final IAuthService _repo;

  MenuController(this._repo);

  final List<MenuItem> menuItems = [
    // MenuItem(Icons.home, MainRouting.HOME_ROUTE, 'Inicio'),
    MenuItem(Icons.account_circle, MainRouting.PROFILE_ROUTE, 'Mi Perfil'),
    MenuItem(Icons.food_bank, RewardsRouting.CONSUME_ROUTE, 'MiS Consumos'),
    MenuItem(Icons.account_circle, UbicationsRouting.UBICATIONS_ROUTE,
        'Ubicaciones'),
  ];
  // final zoomDrawerController = ZoomDrawerController();

  var user = User.fromVoid().obs;
  @override
  void onInit() async {
    super.onInit();
    var existingUser = await _repo.checkUser();
    if (existingUser != null) {
      user.value = existingUser;
    } else {
      Get.toNamed(AuthRouting.LOGIN_ROUTE);
    }
  }

  goTo(String route) {
    Get.toNamed(route);
  }

  // void toggleDrawer() {
  //   zoomDrawerController.toggle?.call();
  //   update();
  // }
}
