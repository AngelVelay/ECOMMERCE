import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomInputText extends StatelessWidget {
  const CustomInputText(this.name, this.label,
      {this.validator,
      this.initialValue,
      this.keyboardType = TextInputType.text});

  final String name;
  final dynamic validator;
  final String? initialValue;
  final String label;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      keyboardType: keyboardType,
      validator: validator,
      initialValue: initialValue,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2.0,
          ),
        ),
        // border: const OutlineInputBorder(),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        fillColor: Colors.white,
      ),
    );
  }
}
