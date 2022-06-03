// import 'package:esmanagement/app/pages/main/main.controller.dart';
// import 'package:esmanagement/app/widgets/progress/progress_liner.widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MenuScreenDrawer extends GetView<MainController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).inputDecorationTheme.fillColor,
//       body: SafeArea(
//         child: Obx(() {
//           return controller.loading.value
//               ? ProgressLinerPrymary()
//               : ListView(
//                   physics: NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   children: [
//                     _header(context).paddingOnly(top: 10, left: 5, bottom: 10),
//                     //_listMenu(context)
//                     _listMenuChange(context)
//                   ],
//                 ).paddingOnly(left: 5);
//         }),
//       ),
//     );
//   }

//   Widget _picture(BuildContext context) {
//     return Align(
//       alignment: Alignment.center,
//       child: GestureDetector(
//         onTap: () => controller.goToProfile(),
//         child: Hero(
//           tag: 'hero-profile',
//           child: Container(
//               width: context.isTablet ? 95 : 65,
//               height: context.isTablet ? 95 : 65,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 image:
//                     new DecorationImage(fit: BoxFit.cover, image: _getImage()),
//               )),
//         ),
//       ),
//     );
//   }

//   ImageProvider<Object> _getImage() {
//     ImageProvider _imageDefault = AssetImage('assets/images/user_default.jpg');
//     var found = false;

//     var _imageNetwork = new NetworkImage(
//         '${MainController.imagesUrl}${controller.userV.value.id != 0 ? controller.userV.value.picture : 'profile.jpg'}');

//     _imageNetwork.evict().then<void>((bool success) {
//       if (success) {
//         found = true;
//       }
//     });

//     return found ? _imageNetwork : _imageDefault;
//   }

//   Widget _header(BuildContext context) {
//     return Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           _picture(context),
//           Text(
//             '${controller.profile.first.nombreCompleto}',
//             textAlign: TextAlign.center,
//             style: Theme.of(context)
//                 .textTheme
//                 .subtitle1!
//                 .apply(fontWeightDelta: FontWeight.bold.index),
//             overflow: TextOverflow.fade,
//             softWrap: true,
//             maxLines: 3,
//           ).paddingOnly(top: 10),
//         ],
//       ).paddingOnly(
//         right: context.isTablet
//             ? MediaQuery.of(context).size.width * 0.60
//             : MediaQuery.of(context).size.width * 0.30,
//       ),
//     );
//   }

//   Widget _listMenuChange(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width / 2,
//       child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//         blackIconMenu(context).paddingOnly(
//             left: context.isTablet ? 23 : 5, top: context.isTablet ? 23 : 10),
//       ]),
//     );
//   }

//   Widget blackIconMenu(BuildContext context) {
//     return Container(
//       width: context.isTablet
//           ? MediaQuery.of(context).size.width * 0.38
//           : MediaQuery.of(context).size.width * 0.63,
//       height: context.isTablet
//           ? MediaQuery.of(context).size.height * 0.75
//           : MediaQuery.of(context).size.height * 0.65,
//       decoration: BoxDecoration(
//           color: Colors.transparent,
//           borderRadius: BorderRadius.all(Radius.circular(18))),
//       child: ListView.builder(
//         physics: BouncingScrollPhysics(),
//         itemCount: controller.menuItems.length,
//         itemBuilder: (context, index) {
//           return controller.menuItems[index].label != '-'
//               ? ExpansionTile(
//                   onExpansionChanged: ((value) {
//                     if (controller.menuItems[index].label == "Inicio") {
//                       controller.actionDrawer();
//                     }

//                     if (controller.menuItems[index].subMenus == null) {
//                       //controller.actionDrawer();
//                       controller.menuItems[index].action();
//                     }
//                   }),
//                   iconColor: Colors.white38,
//                   collapsedIconColor: Colors.white38,
//                   leading: controller.menuItems[index].icon,
//                   expandedCrossAxisAlignment: CrossAxisAlignment.start,
//                   title: Text(
//                     controller.menuItems[index].label,
//                     style: Theme.of(context).textTheme.bodyText1,
//                     overflow: TextOverflow.fade,
//                     maxLines: 2,
//                     softWrap: true,
//                   ),
//                   trailing: controller.menuItems[index].subMenus != null
//                       ? null
//                       : Container(
//                           height: 1,
//                           width: 1,
//                         ),
//                   children: controller.menuItems[index].subMenus != null
//                       ? controller.menuItems[index].subMenus!.map((e) {
//                           return subMenu(context, e.name, e.icon, e.url)
//                               .paddingOnly(bottom: 13, top: 8);
//                         }).toList()
//                       : [])
//               : Divider(
//                   color: Colors.grey[400],
//                   endIndent: 15,
//                   indent: 15,
//                 );
//         },
//       ),
//     );
//   }

//   Widget subMenu(BuildContext context, String text, String icon, String route) {
//     return text != "-"
//         ? InkWell(
//             onTap: () {
//               Get.toNamed(route);
//             },
//             child: Padding(
//                 padding: const EdgeInsets.only(left: 20, right: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Icon(
//                       IconData(int.parse(icon), fontFamily: 'MaterialIcons'),
//                       size: 22,
//                     ).paddingOnly(left: 20, right: 10),
//                     Flexible(
//                       child: Text(text,
//                               style: TextStyle(fontSize: 13),
//                               softWrap: true,
//                               maxLines: 2,
//                               textAlign: TextAlign.start)
//                           .paddingOnly(left: 3, right: 3),
//                     ),
//                   ],
//                 )),
//           )
//         : Divider(
//             color: Colors.grey[400],
//             endIndent: 35,
//             indent: 35,
//           );
//   }
// }
