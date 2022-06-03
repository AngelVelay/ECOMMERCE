import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/auth/auth.module.dart';
import 'package:jexpoints/app/modules/main/main.module.dart';
import 'package:jexpoints/app/shared/values/enviroments.dart';
import '../../../../../auth/entities/user.type.dart';
import '../../../../../auth/services/auth/auth.contract.dart';

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
    MenuItem(Icons.home, MainRouting.HOME_ROUTE, 'Inicio'),
    MenuItem(Icons.account_circle, MainRouting.PROFILE_ROUTE, 'Mi Perfil'),
    MenuItem(Icons.food_bank, MainRouting.CONSUME_ROUTE, 'MiS Consumos'),
    MenuItem(Icons.account_circle, MainRouting.UBICATIONS_ROUTE, 'Ubicaciones'),
  ];
  final zoomDrawerController = ZoomDrawerController();

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

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }
}
