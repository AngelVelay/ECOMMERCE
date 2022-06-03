// import 'package:flutter/material.dart';
// import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
// import 'package:jexpoints/app/modules/home/views/home/home.page.dart';
// import 'package:jexpoints/app/modules/main/views/consume/consume.page.dart';
// import 'package:jexpoints/app/modules/main/views/profile/profile.page.dart';
// import 'package:jexpoints/app/modules/main/views/ubications/ubications_page.dart';

// import '../../../../../../components/circular-progress-bar/circular-progress-bar.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   int currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return ZoomDrawer(
//       moveMenuScreen: false,
//       menuScreen: DrawerScreen(
//         setIndex: (index) {
//           setState(() {
//             currentIndex = index;
//           });
//         },
//       ),
//       mainScreen: currentScreen(),
//       borderRadius: 30,
//       showShadow: true,
//       angle: 0.0,
//       slideWidth: 200,
//       menuBackgroundColor: Color(0xFF222222),
//     );
//   }

//   Widget currentScreen() {
//     switch (currentIndex) {
//       case 0:
//         return HomePage();
//       case 1:
//         return ProfilePage();
//       case 2:
//         return ConsumePage();
//       case 3:
//         return UbicationsPage();

//       default:
//         return HomeScreen();
//     }
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         centerTitle: true,
//         leading: DrawerWidget(),
//       ),
//     );
//   }
// }

// class DrawerScreen extends StatefulWidget {
//   final ValueSetter setIndex;
//   const DrawerScreen({Key? key, required this.setIndex}) : super(key: key);

//   @override
//   State<DrawerScreen> createState() => _DrawerScreenState();
// }

// class _DrawerScreenState extends State<DrawerScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF222222),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           CircularProgressBar(sizeProgressBar: 30.0, AvatarSize: 25),
//           const SizedBox(height: 25),
//           const Text(
//             'Hola, Angel Velay',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               drawerList(Icons.home, "Home", 0),
//               drawerList(Icons.person, "Profile", 1),
//               drawerList(Icons.food_bank, "Consumos", 2),
//               drawerList(Icons.location_on_sharp, "Ubicaciónes", 3),
//             ],
//           ),
//           Spacer(),
//           const Image(
//             width: 65,
//             height: 65,
//             image: AssetImage('assets/images/esperanza_logo.png'),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget drawerList(IconData icon, String text, int index) {
//     return GestureDetector(
//       onTap: () {
//         widget.setIndex(index);
//       },
//       child: Container(
//         margin: EdgeInsets.only(left: 20, bottom: 12),
//         child: Row(
//           children: [
//             Icon(
//               icon,
//               color: Colors.white,
//             ),
//             SizedBox(
//               width: 12,
//             ),
//             Text(
//               text,
//               style:
//                   TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DrawerWidget extends StatelessWidget {
//   const DrawerWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         ZoomDrawer.of(context)!.toggle();
//       },
//       icon: Icon(Icons.menu),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../../../../components/circular-progress-bar/circular-progress-bar.dart';
import '../../../../../auth/auth.module.dart';
import 'menu.controller.dart';

class Menu extends GetView<MenuController> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: controller.menuItems.length + 1,
            itemBuilder: (_, index) {
              if (index == 0) {
                return DrawerHeader(
                    child: Obx(() {
                      return Column(children: [
                        Center(
                            // child: Container(
                            //     width: 100,
                            //     height: 100,
                            //     decoration: (controller.user.value.id != null &&
                            //             controller.user.value.employee != null)
                            //         ? BoxDecoration(
                            //             shape: BoxShape.circle,
                            //             image: DecorationImage(
                            //               fit: BoxFit.fill,
                            //               image: NetworkImage(controller
                            //                   .user.value.employee!.picture!),
                            //             ),
                            //           )
                            //         : const BoxDecoration(
                            //             shape: BoxShape.circle,
                            //             image: DecorationImage(
                            //                 fit: BoxFit.fill,
                            //                 image: AssetImage(
                            //                     'assets/images/profile.png'))))),
                            child: Container(
                          alignment: Alignment.center,
                          child: CircularProgressBar(
                            sizeProgressBar: 40.0, 
                            AvatarSize: 30,  
                            percent: 0,                          
                          ),
                        )),
                        Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                                controller.user.value.id != null
                                    ? controller.user.value.username
                                    : '',
                                style: const TextStyle(color: Colors.white)),
                          ),
                        ),
                      ]);
                    }),
                    decoration: const BoxDecoration(color: Color(0xFF222222)));
              }
              final e = controller.menuItems[index - 1];
              return ListTile(
                leading: Icon(e.icon),
                title: Text(e.label),
                onTap: () {
                  Navigator.of(context).pop();
                  controller.goTo(e.route);
                },
              );
            },
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF222222),
              ),
              onPressed: () => Get.toNamed(AuthRouting.LOGIN_ROUTE),
              icon: Icon(Icons.exit_to_app),
              label: Text('Salir'),
            ),
          )
        ],
      ),
    );
  }
}
