import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CircleIconButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final IconData iconData;
  late double? size;
  late Color? backgroundColor;
  late Color? foregroundColor;

  CircleIconButton(
      {required this.iconData,
      required this.onPressed,
      double? size,
      Color? backgroundColor,
      Color? foregroundColor}) {
    this.size = size ?? 40;
    this.backgroundColor = backgroundColor;
    this.foregroundColor = foregroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        child: RawMaterialButton(
          onPressed: onPressed,
          elevation: 2,
          fillColor: backgroundColor ?? Theme.of(context).colorScheme.secondary,
          child: Icon(iconData,
              size: size! * 0.6,
              color:
                  foregroundColor ?? Theme.of(context).colorScheme.secondary),
          shape: CircleBorder(),
        ));
  }
}
