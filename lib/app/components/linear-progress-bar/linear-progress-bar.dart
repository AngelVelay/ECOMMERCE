import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LinearProgressBar extends StatelessWidget {
  final String trailing;
  const LinearProgressBar({Key? key, required this.trailing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: LinearPercentIndicator(
        width: 300,
        animation: true,
        lineHeight: 35.0,
        animationDuration: 2000,
        trailing: Text(trailing, style: TextStyle(fontWeight: FontWeight.bold)),
        // leading: Text(
        //   'Nivel Oro',
        //   style: TextStyle(fontWeight: FontWeight.bold),
        // ),
        percent: 0.9,
        center: Text("Nivel Oro",
            style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        barRadius: Radius.circular(16),
        progressColor: Color(0xFFc59400),
      ),
    );
  }
}
