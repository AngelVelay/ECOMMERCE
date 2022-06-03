import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown(
      {required this.labelText,
      required this.onchange,
      required this.selectedId,
      required this.listDynamic});

  final Function(int?) onchange;
  final String labelText;
  final int selectedId;
  final List<DropdownMenuItem<int>>? listDynamic;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      isExpanded: true,
      value: selectedId,
      items: listDynamic,
      onChanged: (value) => onchange(value),
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
          borderRadius: BorderRadius.circular(16.5),),
      ),
    ).paddingOnly(left: 20, top: 20, right: 20);
  }
}

class CustomDropDownRounded extends StatelessWidget {
  CustomDropDownRounded(
      {required this.labelText,
      required this.onchange,
      required this.selectedId,
      required this.listDynamic});

  final Function(int?) onchange;
  final String labelText;
  final int selectedId;
  final List<DropdownMenuItem<int>>? listDynamic;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      isExpanded: true,
      value: selectedId,
      items: listDynamic,
      onChanged: (value) => onchange(value),
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
    ).paddingOnly(top: 20);
  }
}
