import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main.controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconSize = 18;
    return Obx(() {
      return SafeArea(
        top: false,
        child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                // backgroundColor: Colors.black,
                // unselectedItemColor: Colors.white,
                // selectedItemColor: Colors.white,
                selectedItemColor: Colors.black,
                unselectedLabelStyle: const TextStyle(fontSize: 9),
                selectedLabelStyle: const TextStyle(fontSize: 9),
                currentIndex: controller.pageIndex$.value,
                onTap: (index) => controller.changeTab(index),
                items: controller.navigationItems
                    .map((e) => e.badgeValue == null
                        ? BottomNavigationBarItem(
                            icon: e.icon != null
                                ? Icon(e.icon)
                                : e.assetPath != null
                                    ? Image.asset(
                                        e.assetPath!,
                                        width: iconSize,
                                        height: iconSize,
                                      )
                                    : const Icon(Icons.device_unknown),
                            label: e.label)
                        : BottomNavigationBarItem(
                            icon: Badge(
                                animationType: BadgeAnimationType.fade,
                                badgeColor: Colors.black,
                                badgeContent: Text(
                                  '${e.badgeValue!.value}',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                child: e.icon != null
                                    ? Icon(e.icon)
                                    : e.assetPath != null
                                        ? Image.asset(
                                            e.assetPath!,
                                            width: iconSize,
                                            height: iconSize,
                                          )
                                        : const Icon(Icons.device_unknown)),
                            label: e.label,
                          ))
                    .toList()),
            body: Obx(() {
              return controller.navigationItems
                  .map((e) => e.page)
                  .toList()[controller.pageIndex$.value];
            })),
      );
    });
  }
}
