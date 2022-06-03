import 'package:flutter/material.dart';

class StatusIndicator {
  static custom(Color? color) => _line(color: color!);

  static progress() => _line(color: Colors.grey);

  static generic() => _line(color: Colors.grey[300]!);

  static cancel() => _line(color: Colors.red);

  static approved() => _line(color: Colors.lightGreenAccent);

  static _line({Color color = Colors.transparent}) => Container(
          child: VerticalDivider(
        color: color,
        thickness: 10,
      ));
}

class StatusIcons {
  static custom(IconData icon,
          {Color color = Colors.lightBlueAccent,
          double size = 24.0,
          String label = ""}) =>
      _line(icon, color: color, size: size, label: label);

  static generic({double size = 24.0, String label = "enviado"}) =>
      _line(Icons.pending_outlined,
          color: Colors.grey[300]!, size: size, label: label);

  static cancel({double size = 24.0, String label = "Cancelado"}) =>
      _line(Icons.dangerous_outlined,
          color: Colors.red, size: size, label: label);

  static approved({double size = 24.0, String label = "Aprovado"}) =>
      _line(Icons.check_outlined,
          color: Colors.lightGreenAccent, size: size, label: label);

  static _line(IconData icon,
          {Color color = Colors.transparent,
          double size = 24.0,
          String label = ""}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Icon(
              icon,
              color: color,
              size: size,
            ),
          ),
        /*  label != ""
              ?Flexible(
            flex: 1,
            child:  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      label,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: size / 1.6, color: Colors.white70),
                    ))
          ): Container(),*/
        ],
      );
}
