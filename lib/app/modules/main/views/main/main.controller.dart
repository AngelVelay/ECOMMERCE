import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/tab-home.controller.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/tab-home.page.dart';
import '../../../rewards/views/tab-rewards/tab-rewards.page.dart';
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
    TabItem(const HomePage(), 'Inicio', icon: Icons.home),
    TabItem(const StorePage(), 'Tienda',
        assetPath: 'assets/icons_tab_bar/heart.png', icon: Icons.store),
    TabItem(const RewardsPage(), 'Rewards',
        assetPath: 'assets/icons_tab_bar/star.png', icon: Icons.star),
    TabItem(const UbicationsPage(), 'Sucursales',
        assetPath: 'assets/icons_tab_bar/marker.png', icon: Icons.location_on),
    TabItem(ShoppingCartPage(), 'Carrito',
        icon: Icons.shopping_cart, badgeValue: controllerHome.cartItems$)
  ];

  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  changeTab(int index) {
    pageIndex$.value = index;
  }
}
