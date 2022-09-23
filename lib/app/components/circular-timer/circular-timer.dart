import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerQr extends StatelessWidget {
  late double height;

  TimerQr({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
        duration: 60,
        initialDuration: 0,
        controller: CountDownController(),
        width: MediaQuery.of(context).size.width / 3,
        height: height,
        ringColor: Colors.grey[300]!,
        ringGradient: null,
        fillColor: const Color.fromARGB(255, 77, 80, 94),
        fillGradient: null,
        backgroundColor: const Color(0xFF222222),
        backgroundGradient: null,
        strokeWidth: 10.0,
        strokeCap: StrokeCap.square,
        textStyle: const TextStyle(
            fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold),
        textFormat: CountdownTextFormat.S,
        isReverse: true,
        isReverseAnimation: true,
        isTimerTextShown: true,
        autoStart: true,
        onStart: () {
          debugPrint('Empieza Conteo');
        },
        onComplete: () {
          Get.back();
        });
  }
}
