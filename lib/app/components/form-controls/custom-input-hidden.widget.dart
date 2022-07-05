import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomInputHidden extends StatelessWidget {
  const CustomInputHidden(this.name, {this.initialValue});

  final String name;
  final dynamic initialValue;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: name,
      initialValue: initialValue,
      builder: (FormFieldState<dynamic> field) {
        return const SizedBox.shrink();
      },
    );
  }
}
