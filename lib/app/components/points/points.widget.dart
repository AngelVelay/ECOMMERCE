import 'package:flutter/material.dart';

class PointsViewer extends StatelessWidget {
  final double size;
  late String value = '35';
  late double fontSize = 50;

  PointsViewer(
      {Key? key,
      required this.size,
      required this.fontSize,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, 
      children: [
        Image(
            width: size,
            height: size,
            image: const AssetImage('assets/images/estrella1.png')),
        Text(
          value,
          style: TextStyle(
            fontSize: fontSize,
            // color: Colors.black,
            color: Colors.black54,
            // fontWeight: FontWeight.bold
          )
        ),
      ]
    );
  }
}