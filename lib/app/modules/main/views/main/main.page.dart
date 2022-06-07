import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main.controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
          key: controller.bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: const [
            Icon(Icons.home, size: 30),
            Icon(Icons.grid_view, size: 30),
            Icon(Icons.credit_card, size: 30),
            Icon(Icons.place_outlined, size: 30),
            Icon(Icons.person_outline_outlined, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.black,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 500),
          onTap: (index) => controller.changeTab(index),
          letIndexChange: (index) => true,
        ),
        body: Obx(() {
          return controller.screens[controller.pageIndex$.value];
        }));
  }
}
