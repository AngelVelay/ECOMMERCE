// import 'package:esmanagement/app/pages/main/home/home.page.dart';
// import 'package:esmanagement/app/pages/main/main.controller.dart';
// import 'package:esmanagement/app/utils/msg.utils.dart';
// import 'package:esmanagement/app/widgets/menu/menu_screen_drawer.widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
// import 'package:get/get.dart';

// class MenuZoomDrawer extends GetView<MainController> {
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () => MsgUtils.exit(
//         context,
//         () => SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
//         message: "¿Seguro quieres cerrar la app?",
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.white10,
//         body: ZoomDrawer(
//           overlayBlend: BlendMode.color,
//           backgroundColor: Colors.transparent,
//           controller: controller.zoomDrawerController.value,
//           style: DrawerStyle.Style1,
//           menuScreen: MenuScreenDrawer(),
//           mainScreenTapClose: true,
//           shadowLayer2Color: Colors.black45,
//           mainScreen: HomePage(),
//           borderRadius: 24.0,
//           showShadow: true,
//           openCurve: Curves.fastOutSlowIn,
//           closeCurve: Curves.fastOutSlowIn,
//           angle: context.isTablet ? -16 : -8,
//           slideWidth: MediaQuery.of(context).size.width *
//               (ZoomDrawer(mainScreen: Container(), menuScreen: Container())
//                       .isRtl
//                   ? .50
//                   : context.isTablet
//                       ? 0.50
//                       : 0.75),
//         ),
//         floatingActionButton: _alertButton(context),
//       ),
//     );
//   }

//   Widget _alertButton(BuildContext context) {
//     return Obx(() {
//       return Visibility(
//         visible: controller.validationAccess(controller.roleId.value),
//         child: FloatingActionButton(
//           materialTapTargetSize: MaterialTapTargetSize.padded,
//           child: Icon(Icons.warning_amber_rounded),
//           backgroundColor: Colors.amber[400],
//           onPressed: () => MsgUtils.confirm(
//               context,
//               '¿Seguro quieres enviar una alerta?',
//               () => controller.sendMonitoringAlert(),
//               () => {Get.back()}),
//         ),
//       );
//     });
//   }
// }
