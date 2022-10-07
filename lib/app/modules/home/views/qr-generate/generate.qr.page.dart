import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/app-bar/simple_app_bar/simple_app_bar.widget.dart';

import 'package:qr_flutter/qr_flutter.dart';

import '../../../../components/circular-timer/circular-timer.dart';
import 'generate.qr.controller.dart';

class QrGeneratePage extends GetView<QrGenerateController> {
  const QrGeneratePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: SimpleAppBar(title: 'Escanea tu código'),
        // appBar: AppBar(
        //   title: Text('Escanea tu código',
        //       style: TextStyle(
        //           color: Colors.white,
        //           fontSize: 13.sp,
        //           fontWeight: FontWeight.bold,
        //           fontFamily: 'Montserrat')),
        //   backgroundColor: const Color(0xFF222222),
        // ),
        body: SingleChildScrollView(
            child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height - 150,
                child: Obx(() {
                  return controller.isLoading$.value
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              _qrWidget(
                                  context, '${controller.qrCode$.value.id}'),
                              const SizedBox(height: 20),
                              TimerQr(
                                  height: 110,
                                  duration:
                                      controller.qrCode$.value.validSeconds),
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                  onTap: () => {controller.scanOk(context)},
                                  child: const Text(''))
                            ]);
                }))));
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
