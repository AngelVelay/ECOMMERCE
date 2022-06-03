import 'package:flutter/material.dart';

class CustomBottomSheet{

  static bottomSheet(BuildContext context,{required Widget widget})=>
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) => SingleChildScrollView(
          child: Container(
            color: Theme.of(context).indicatorColor,
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: widget,
          ),
        ),
      );

}