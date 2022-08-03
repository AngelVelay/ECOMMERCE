import 'package:flutter/material.dart';
import 'package:jexpoints/app/modules/auth/entities/branch.type.dart';

class CustomSelect extends StatelessWidget {
  final Function(String?) onChanged;
  final List<dynamic> data;
  // final int selectedItem;
  final String propNameId;
  final String label;
  final String propNameDescription;

  CustomSelect(
      {required this.label,
      required this.data,
      required this.onChanged,
      required this.propNameId,
      required this.propNameDescription});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      // value: selectedItem,
      items: data
          .map((e) => DropdownMenuItem<String>(
              value: e[propNameId].toString(),
              child: Text(e[propNameDescription])))
          .toList(),
      onChanged: (value) => onChanged(value),
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
