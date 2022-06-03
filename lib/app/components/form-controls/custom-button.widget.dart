import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.text, required this.onPressed});

  final GestureTapCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Container(
          child: Text(text, style: const TextStyle(color: Colors.white)),
          padding: const EdgeInsets.all(20)),
      style: ElevatedButton.styleFrom(
          primary: Theme.of(context).accentColor,
          onPrimary: Theme.of(context).primaryColor),
    );
  }
}
