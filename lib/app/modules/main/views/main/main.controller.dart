import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/views/tab-rewards/tab-rewards.page.dart';

import '../../services/creditCard/creditCard.contract.dart';
import '../catalogos/catalogos.page.dart';
import '../points/points.page.dart';
import '../profile/profile.page.dart';
import '../tab-home/components/shopipng-cart.widget.dart';
import '../tab-home/tab-home.page.dart';
import '../tab-shopping-cart/tab-shoppin-cart.page.dart';
import '../ubications/ubications.page.dart';

class TabItem {
  final IconData icon;
  final Widget page;
  final String label;

  TabItem(this.icon, this.page, this.label);
}

class MainController extends GetxController {
  late ICreditCardService creditCardService;

  var pageIndex$ = 0.obs;
  late var cartItems$ = 0.obs;

  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  final screens = [
    const HomePage(),
    const CatalogosPage(),
    const RewardsPage(),
    const UbicationsPage(),
    ShoppingCartPage(),

     UbicationsPage(),
    // const ProfilePage(),
  ];

  changeTab(int index) {
    pageIndex$.value = index;
  }
}
