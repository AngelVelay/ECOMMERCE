import 'package:flutter/material.dart';
import 'package:jexpoints/app/components/form-controls/custom-button.widget.dart';

class SimpleAppBarAction extends StatelessWidget {
  final String description;
  final GestureTapCallback onPressed;

  const SimpleAppBarAction(
      {required this.description, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        fit: FlexFit.loose,
        flex: 1,
        child: CustomButton(text: description, onPressed: this.onPressed));
  }
}
