import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String labelText;
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;

  const CustomContainer(
      {required this.labelText,
      required this.children,
      this.crossAxisAlignment = CrossAxisAlignment.start});
  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: labelText,
        alignLabelWithHint: true,
        isDense: false,
        labelStyle: TextStyle(overflow: TextOverflow.clip),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
          borderRadius: BorderRadius.circular(16.5),),
      ),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      ),
    );
  }
}
