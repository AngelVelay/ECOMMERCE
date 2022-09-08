import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:jexpoints/app/modules/main/views/main/main.page.dart';

class PickUpConfirmPage extends StatelessWidget {
  const PickUpConfirmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedSplashScreen(
            splashIconSize: 300,
            duration: 4000,
            splash: Container(
              height: 400,
              child: Column(
                children: const [
                  Expanded(
                    child: FadeInImage(
                        height: 400,
                        width: 400,
                        fit: BoxFit.cover,
                        placeholder: AssetImage('assets/images/pickup.gif'),
                        image: AssetImage('assets/images/pickup.gif')),
                  ),
                  SizedBox(height: 20),
                  Text('Tu pedido se esta preparando en la tienda...',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            nextScreen: MainPage(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: const Color(0xFFffffff)));
  }
}
