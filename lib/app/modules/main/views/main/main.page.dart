import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main.controller.dart';
import 'widgets/menu/menu.widget.dart';

class MainPage extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.navigationItems.length,
      child: Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).accentColor,
          title: Row(
            children: [
              Builder(
                builder: (context) => GestureDetector(
                  child: Obx(() {
                    return Container(
                        width: 30,
                        height: 30,
                        decoration: (controller.user.value.id != null &&
                                controller.user.value.employee != null)
                            ? BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      controller.user.value.employee!.picture!),
                                ),
                              )
                            : const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        'assets/images/profile.png'))));
                  }),
                  onTap: () => Scaffold.of(context).openDrawer(),
                ),
              ),
              Spacer(),
              Center(
                  child: Text(
                controller.appName,
                style: Theme.of(context).textTheme.headline2,
              )),
              Spacer(),
              GestureDetector(
                child: Icon(Icons.exit_to_app,
                    color: Theme.of(context).buttonColor),
                onTap: () => controller.signInOut(),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
            height: 70,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.only(bottom: 20),
            child: TabBar(
                indicatorColor: Theme.of(context).indicatorColor,
                tabs: controller.navigationItems
                    .map(
                      (e) => new Tab(
                          icon: Icon(e.icon,
                              color: Theme.of(context).buttonColor)),
                    )
                    .toList())),
        body: TabBarView(
          children: controller.navigationItems.map((e) => e.page).toList(),
        ),
      ),
    );
  }
}
