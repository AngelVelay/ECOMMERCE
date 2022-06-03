import 'package:flutter/material.dart';

class ProgressPrimary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Center(
        child: CircularProgressIndicator(
          backgroundColor: Theme.of(context).hoverColor,
          strokeWidth: 3,
          valueColor: new AlwaysStoppedAnimation<Color>(
              Theme.of(context).primaryColor),
        ),
      );
  }
}
