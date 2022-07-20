import 'package:badges/badges.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../tab-home/tab-home.controller.dart';
import 'main.controller.dart';

class MainPage extends GetView<MainController> {
  MainPage({Key? key}) : super(key: key);
  final HomeController controllerHome = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SafeArea(
        top: false,
        child: Scaffold(
            // extendBody: true,
            // bottomNavigationBar: CurvedNavigationBar(
            //   // key: controller.bottomNavigationKey,
            //   index: 0,
            //   height: 60.0,
            //   items: [
            //     const Icon(Icons.home, size: 30),
            //     const Icon(Icons.grid_view, size: 30),
            //     const Icon(Icons.credit_card, size: 30),
            //     const Icon(Icons.place_outlined, size: 30),
            //     Badge(
            //       animationType: BadgeAnimationType.scale,
            //       badgeContent: Text(
            //         '${controllerHome.cartItems$}',
            //         style: TextStyle(color: Colors.white),
            //       ),
            //       child: Icon(Icons.shopping_cart_outlined, size: 30),
            //     ),
            //     // Icon(Icons.person_outline_outlined, size: 30),
            //   ],
            //   color: Colors.white,
            //   buttonBackgroundColor: Colors.white,
            //   backgroundColor: Colors.transparent,
            //   animationCurve: Curves.easeInOut,
            //   animationDuration: const Duration(milliseconds: 500),
            //   onTap: (index) => controller.changeTab(index),
            //   letIndexChange: (index) => true,
            // ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black,
              currentIndex: controller.pageIndex$.value,
              onTap: (index) => controller.changeTab(index),
              items: [
                BottomNavigationBarItem(
                  backgroundColor: Color(0xFFFFFFFF),
                  icon: Image.asset(
                    'assets/icons_tab_bar/home.png',
                    width: 30,
                    height: 30,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons_tab_bar/heart.png',
                    width: 30,
                    height: 30,
                  ),
                  label: 'Tienda',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons_tab_bar/star.png',
                    width: 30,
                    height: 30,
                  ),
                  label: 'Rewards',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons_tab_bar/marker.png',
                    width: 30,
                    height: 30,
                  ),
                  label: 'Ubicaciónes',
                ),
                BottomNavigationBarItem(
                  icon: Badge(
                    animationType: BadgeAnimationType.scale,
                    badgeContent: Text(
                      '${controllerHome.cartItems$}',
                      style: TextStyle(color: Colors.white),
                    ),
                    child: Icon(
                      Icons.shopping_cart,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  label: 'Carrito',
                ),
              ],
            ),
            body: Obx(() {
              return controller.screens[controller.pageIndex$.value];
            })),
      );
    });
  }
}
