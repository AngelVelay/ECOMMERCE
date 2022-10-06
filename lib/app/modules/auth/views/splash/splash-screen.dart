import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:jexpoints/app/modules/main/views/main/main.controller.dart';
import 'package:jexpoints/app/modules/main/views/main/main.page.dart';

import '../../../auth/views/login/login.page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedSplashScreen(
            splashIconSize: 500,
            duration: 3000,
            splash: Column(
              children: const [
                SizedBox(height: 200),
                FadeInImage(
                    width: 90,
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/images/splash.gif'),
                    image: AssetImage('assets/images/splash.gif')),
              ],
            ),
            nextScreen: LoginPage(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: const Color(0xFF00000)));
  }
}
