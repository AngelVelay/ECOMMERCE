import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  CustomRoundedButton({required this.text, required this.onPressed});

  final GestureTapCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Text(text, style: TextStyle(fontSize: 16)),
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: BorderSide(color: Colors.black87)))),
        onPressed: onPressed);
  }
}
