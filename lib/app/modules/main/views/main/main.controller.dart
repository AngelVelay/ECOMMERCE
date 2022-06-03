import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/auth/auth.module.dart';
import 'package:jexpoints/app/core/utils/storage.utils.dart';
import 'package:jexpoints/app/shared/values/globals.dart';

import '../../../auth/entities/user.type.dart';
import '../../../auth/services/auth/auth.contract.dart';
import '../../../home/views/home/home.page.dart';
import '../tst/tst.page.dart';

class TabItem {
  final IconData icon;
  final Widget page;
  final String label;

  TabItem(this.icon, this.page, this.label);
}

class MainController extends GetxController {
  late IAuthService _repo;

  final List<TabItem> navigationItems = [
    TabItem(Icons.home, HomePage(), 'Inicio'),
    TabItem(Icons.account_circle, TstPage(), 'Mi Perfil'),
  ];

  MainController(this._repo);

  var user = User.fromVoid().obs;
  String appName = Globals.APP_NAME;

  @override
  void onInit() async {
    var existingUser = await _repo.checkUser();
    if (existingUser != null) {
      user.value = existingUser;
    } else {
      Get.toNamed(AuthRouting.LOGIN_ROUTE);
    }

    super.onInit();
  }

  void signInOut() {
    LocalStorageUtils.setStringKey(Globals.CURRENT_USER_KEY, '');
    Get.toNamed(AuthRouting.LOGIN_ROUTE);
  }
}
