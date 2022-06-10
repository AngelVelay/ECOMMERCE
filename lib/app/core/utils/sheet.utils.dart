import 'package:flutter/material.dart';
import 'package:jexpoints/app/components/sheets/sheet_container.widget.dart';

class SheetUtils {
  static show(BuildContext context, Widget content,
      {String? title, Function? onCancel, double height = 0}) {
    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) {
          return SheetContainer(content, title, onCancel, height);
        });
  }
}
