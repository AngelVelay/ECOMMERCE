import 'package:flutter/material.dart';
import 'package:jexpoints/app/components/sheets/sheet_container.widget.dart';

class SheetUtils {
  static show(BuildContext context, Widget content,
      {String? title, Function? onCancel}) {
    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return SheetContainer(content, title, onCancel);
        });
  }
}
