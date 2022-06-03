import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:jexpoints/app/modules/main/views/qr-generate/generate.qr.controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../components/circular-timer/circular-timer.dart';
import '../main/widgets/menu/menu.widget.dart';

class QrGeneratePage extends GetView<QrGenerateController> {
  const QrGeneratePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
            const Text('Escanea tu codigo', style: TextStyle(color: Colors.white)),
            backgroundColor: const Color(0xFF222222),
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height - 150,            
            child: Column(              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _qrWidget(context, controller.data),
                const SizedBox(height: 20),
                TimerQr(height: 110),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: () => { controller.scanOk(context) },
                  child: const Text('Dummy scan')
                ) 
              ]
            ),
          )
        ));
  }

  Widget _qrWidget(BuildContext context, String data) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [          
          QrImage(
            data: data,
            gapless: true,
            size: 300,
            errorCorrectionLevel: QrErrorCorrectLevel.H,
          )
        ],
      ),
    );
  }
}
