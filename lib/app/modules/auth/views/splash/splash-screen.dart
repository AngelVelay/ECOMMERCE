import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
                    placeholder:
                        AssetImage('assets/images/splash.gif'),
                    image: AssetImage('assets/images/splash.gif')),                
              ],
            ),

            // splash: Lottie.network(
            //   'https://assets3.lottiefiles.com/packages/lf20_CbT8Hi.json',
            //   width: 1000,
            //   height: 1000,
            //   fit: BoxFit.fill,
            //
            nextScreen: LoginPage(),
            splashTransition: SplashTransition.fadeTransition,
            // backgroundColor: Color(0xFFffffff))
            backgroundColor: const Color(0xFF00000))
            );
  }
}
