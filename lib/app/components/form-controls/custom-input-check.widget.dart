import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomInputCheck extends StatelessWidget {
  const CustomInputCheck(
    this.name,
    this.label, {
    this.validator,
    this.initialValue,
  });

  final String name;
  final dynamic validator;
  final bool? initialValue;
  final String label;

  @override
  Widget build(BuildContext context) {
    return FormBuilderCheckbox(
      name: name,
      title: Text(label),
      validator: validator,
      initialValue: initialValue,
      // activeColor: Colors.white,
      checkColor: Colors.white,
    );
  }
}
