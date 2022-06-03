// import 'package:esmanagement/core/values/enviroments.dart';
// import 'package:esmanagement/data/models/entities/dynamic/evidences.model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:photo_view/photo_view.dart';

// class MsgOptions {
//   static const String _imagesUrl = Environments.FILE_MANAGER_VIEW_URL;
//   static customWidget(
//       BuildContext context, String title, List<Widget> widgets) async {
//     final result = await Get.dialog(AlertDialog(
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(16))),
//         elevation: 5,
//         contentPadding: EdgeInsets.all(15),
//         buttonPadding: EdgeInsets.all(15),
//         titlePadding: EdgeInsets.only(left: 5),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Flexible(
//               flex: 3,
//               child: Text(
//                 title,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: Theme.of(context)
//                     .textTheme
//                     .subtitle2!
//                     .apply(fontWeightDelta: FontWeight.bold.index),
//               ),
//             ),
//             Flexible(
//               flex: 1,
//               child: IconButton(
//                   onPressed: () => Navigator.of(context).pop(true),
//                   icon: Icon(
//                     Icons.close,
//                     size: 30,
//                   )),
//             )
//           ],
//         ),
//         actionsAlignment: MainAxisAlignment.center,
//         actions: widgets));
//     return result;
//   }

//   static customImage(BuildContext context, String url,
//       {String tag = ""}) async {
//     final result = await Get.dialog(
//       Dialog(
//         insetPadding:
//             EdgeInsets.only(left: 25, right: 25, top: 200, bottom: 200),
//         backgroundColor: Colors.white12,
//         elevation: 5,
//         child: PhotoView(
//             minScale: PhotoViewComputedScale.contained * 0.8,
//             maxScale: PhotoViewComputedScale.covered * 2,
//             imageProvider: NetworkImage(url),
//             errorBuilder: (context, error, stackTrace) {
//               return Image.asset(
//                   "assets/images/404_NotFound.jpeg"); //do something
//             },
//             loadingBuilder: (context, event) =>
//                 Image.asset("assets/images/loading.gif"),
//             heroAttributes: PhotoViewHeroAttributes(tag: "tagItem$tag"),
//             initialScale: PhotoViewComputedScale.contained,
//             backgroundDecoration: BoxDecoration(
//                 backgroundBlendMode: BlendMode.overlay,
//                 color: Colors.grey[900]),
//             enableRotation: false),
//       ),
//       barrierDismissible: true,
//       barrierColor: Colors.white10,
//     );
//     return result;
//   }

//   static customEvidence(BuildContext context, Evidences evidences,
//       {String tag = "", isRemovable=false, GestureTapCallback? onDelete}) async {
//     final result = await Get.dialog(
//       Stack(
//         children: [
//           Visibility(
//             visible: isRemovable,
//             child: Align(
//               alignment: Alignment.topRight,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   GestureDetector(
//                     onTap: onDelete,
//                     child: Icon(
//                       Icons.delete,
//                       color: Colors.red,),
//                   ),
//                   /*GestureDetector(
//                     onTap: ()=>Get.back(),
//                     child: Icon(
//                       Icons.close),
//                   ),*/
//                 ],
//               )
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(60.0),
//             child: PhotoView(
//                 minScale: PhotoViewComputedScale.contained * 0.8,
//                 maxScale: PhotoViewComputedScale.covered * 2,
//                 imageProvider: NetworkImage("$_imagesUrl/${evidences.fileManagerName!}"),
//                 errorBuilder: (context, error, stackTrace)=> Image.asset("assets/images/404_NotFound.jpeg"),
//                 loadingBuilder: (context, event) => Image.asset("assets/images/loading.gif"),
//                 initialScale: PhotoViewComputedScale.covered,
//                 backgroundDecoration: BoxDecoration(
//                     backgroundBlendMode: BlendMode.overlay,
//                     color: Colors.grey[900]),
//                 enableRotation: false),
//           ),
//         ],
//       ),
//       barrierDismissible: true,
//       barrierColor: Colors.white10,
//     );
//     return await result;
//   }

//   showMessage(BuildContext context,
//       {required GestureTapCallback onPressedGallery,
//       required GestureTapCallback onPressedCamera}) {
//     Get.defaultDialog(title: "Selecciona una opción", actions: [
//       Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           _optionText(context, "Galeria", onPressedGallery),
//           _optionText(context, "Cámara", onPressedCamera),
//           Padding(padding: EdgeInsets.all(8)),
//         ],
//       )
//     ]);
//   }

//   ElevatedButton _optionText(
//       BuildContext context, String text, GestureTapCallback onPressed) {
//     return ElevatedButton(
//         onPressed: () => onPressed,
//         child: Text(
//           text,
//           style: Theme.of(context).primaryTextTheme.subtitle1,
//         ),
//         style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all<Color>(Colors.black)));
//   }
// }
