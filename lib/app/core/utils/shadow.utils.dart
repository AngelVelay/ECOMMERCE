import 'package:flutter/material.dart';

class ShadowUtils {
  static BoxDecoration hexImageSmall() {
    return BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
          fit: BoxFit.fill,
          image: new AssetImage('assets/images/logo.png'),
        ));
  }
}
