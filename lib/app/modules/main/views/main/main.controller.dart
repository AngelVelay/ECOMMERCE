import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/tab-home.controller.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/tab-home.page.dart';
import 'package:jexpoints/app/modules/ubications/views/ubications/ubications-branches/ubications-branches.page.dart';
import '../../../rewards/views/rewards/rewards.page.dart';
import '../../../store/views/store/store.page.dart';
import '../../../store/views/tab-shopping-cart/tab-shoppin-cart.page.dart';
import '../../../ubications/views/ubications/ubications.page.dart';
import '../../services/creditCard/creditCard.contract.dart';

class TabItem {
  final Widget page;
  final String label;
  final String? assetPath;
  final IconData? icon;
  final BottomNavigationBarItem? content;
  final RxInt? badgeValue;

  TabItem(this.page, this.label,
      {this.assetPath, this.icon, this.content, this.badgeValue});
}

class MainController extends GetxController {
  late ICreditCardService creditCardService;
  final HomeController controllerHome = Get.find();

  var pageIndex$ = 0.obs;

  late List<TabItem> navigationItems = [
    TabItem(HomePage(), 'Inicio', assetPath: 'assets/icons_tab_bar/home.png'),
    TabItem(const StorePage(), 'Tienda',
        assetPath: 'assets/icons_tab_bar/heart.png'),
    TabItem(const RewardsPage(), 'Rewards',
        assetPath: 'assets/icons_tab_bar/star.png'),
    TabItem(const UbicationsPage(), 'Sucursales',
        assetPath: 'assets/icons_tab_bar/marker.png'),
    TabItem(ShoppingCartPage(), 'Carrito',
        icon: Icons.shopping_cart_rounded,
        badgeValue: controllerHome.cartItems$)
  ];

  // GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  changeTab(int index) {
    pageIndex$.value = index;
  }
}
