import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:jexpoints/app/modules/main/views/qr-generate/generate.qr.controller.dart';

class ButtonQRScanner extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final Color color;
  const ButtonQRScanner(
      {Key? key,
      required this.title,
      required this.width,
      required this.height,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        color: Colors.white,
        width: width,
        height: height,
        child: IconButton(
          padding: const EdgeInsets.all(5),
          icon: Image.asset(
            "assets/cards/qr.png",
          ),
          onPressed: () {
            showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) => _actionSheet(context));
          },
        ),
      )
      // child: ElevatedButton(
      //     style: ButtonStyle(
      //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      //           const RoundedRectangleBorder(
      //               borderRadius: BorderRadius.zero,
      //               side: BorderSide(color: Colors.white))),
      //       backgroundColor:
      //           MaterialStateProperty.all<Color>(const Color(0XFFFFFFFF)),
      //     ),
      //     onPressed: () {
      //       showCupertinoModalPopup(
      //           context: context,
      //           builder: (BuildContext context) => _actionSheet(context));
      //     },
      //     child: FadeInImage(
      //         fit: BoxFit.cover,
      //         height: height,
      //         width: width,
      //         placeholder: const NetworkImage(
      //             'https://tenor.com/view/loading-gif-9212724.gif'),
      //         image: const NetworkImage(
      //           'https://cdn-icons-png.flaticon.com/512/888/888154.png',
      //         ))),

      // Text(
      //   title,
      //   style:
      //       TextStyle(fontSize: 20, color: color, fontWeight: FontWeight.bold),
      // )
    ]);
  }

  static Widget _actionSheet(BuildContext context) {
    return CupertinoActionSheet(
      title: const Text('¿Para que quieres tu QR?'),
      // message: const Text('Selecciona una opcion'),
      actions: [
        CupertinoActionSheetAction(
            onPressed: () => _goTo(context, 'discount'),
            child: const Text('Descuento')),
        CupertinoActionSheetAction(
            onPressed: () => _goTo(context, 'accumulate'),
            child: const Text('Acumular')),
        CupertinoActionSheetAction(
            onPressed: () => _goTo(context, 'change'),
            child: const Text('Canjear')),
      ],
      cancelButton: CupertinoActionSheetAction(
          onPressed: () => _close(context), child: const Text('Cancelar')),
    );
  }

  static _goTo(BuildContext context, String type) {
    Navigator.pop(context);
    Get.toNamed('/generate-qr', arguments: {"type": type});
  }

  static _close(BuildContext context) {
    Navigator.pop(context);
  }
}
