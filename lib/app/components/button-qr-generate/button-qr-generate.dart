import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    Get.toNamed('/generate-qr', arguments: [type]);
  }

  static _close(BuildContext context) {
    Navigator.pop(context);
  }
}
