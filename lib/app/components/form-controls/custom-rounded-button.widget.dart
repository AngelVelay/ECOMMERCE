import 'package:flutter/material.dart';

enum CustomRoundenButtonStyle {
  black,
  white,
  transparentWithBorder,
  blackBordered,
  whiteBordered,
}

class CustomRoundedButton extends StatelessWidget {
  CustomRoundedButton(
      {required this.text,
      required this.onPressed,
      this.style = CustomRoundenButtonStyle.black});

  final GestureTapCallback onPressed;
  final String text;
  final CustomRoundenButtonStyle style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Text(text, style: const TextStyle(fontSize: 16)),
        style: ButtonStyle(
            padding:
                MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
            foregroundColor: MaterialStateProperty.all<Color>(
                style == CustomRoundenButtonStyle.black ||
                        style == CustomRoundenButtonStyle.blackBordered
                    ? Colors.white
                    : Colors.black),
            backgroundColor: MaterialStateProperty.all<Color>(
                style == CustomRoundenButtonStyle.black ||
                        style == CustomRoundenButtonStyle.blackBordered
                    ? Colors.black
                    : style == CustomRoundenButtonStyle.transparentWithBorder
                        ? Colors.transparent
                        : Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: BorderSide(
                        color: style == CustomRoundenButtonStyle.black ||
                                style == CustomRoundenButtonStyle.whiteBordered
                            ? Colors.black
                            : style ==
                                    CustomRoundenButtonStyle.transparentWithBorder
                                ? Colors.white
                                : Colors.white)))),
        onPressed: onPressed);

    // return TextButton(
    //     child: Text(text,
    //         style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    //     style: ButtonStyle(
    //         padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
    //         foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    //         backgroundColor:
    //             MaterialStateProperty.all<Color>(Colors.transparent),
    //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //             RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(50.0),
    //                 side: BorderSide(color: Colors.white)))),
    //     onPressed: onPressed);
  }
}
