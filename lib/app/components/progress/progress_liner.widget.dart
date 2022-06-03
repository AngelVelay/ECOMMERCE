import 'package:flutter/material.dart';

class ProgressLinerPrymary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: Colors.white,
      valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
      minHeight: 5,
    );
  }
}
