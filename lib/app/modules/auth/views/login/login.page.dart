import 'dart:io';

import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/form-controls/custom-rounded-button.widget.dart';
import '../recovery/recovery.page.dart';
import 'login.controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(children: [
          const Spacer(),
          const CircleAvatar(
              radius: 80,
              backgroundColor: Colors.blueGrey,
              child: CircleAvatar(
                  radius: 70,
                  backgroundImage:
                      AssetImage('assets/images/esperanza_logo.png'))),
          const SizedBox(height: 20),
          TextField(
            obscureText: false,
            controller: controller.username,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              labelText: "Usuario",
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
          TextField(
            obscureText: true,
            controller: controller.password,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              labelText: "Contrase??a",
              labelStyle: TextStyle(color: Colors.white),
            ),
          ).paddingOnly(top: 16),
          Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: const Text(
                  "??Olvidaste tu contrase??a?",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => {
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return RecoveryPasswordPage();
                      }),
                },
              )),
          SizedBox(
              width: double.infinity,
              child: Obx(() {
                return CustomRoundedButton(
                  text: '${controller.loginText}',
                  onPressed: () => controller.singIn(),
                  style: CustomRoundenButtonStyle.whiteBordered,
                );
              })),
          const Spacer(),
          Column(
            children: [
              const Text(
                'Ingresa tambi??n con:',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              Platform.isIOS
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GoogleAuthButton(
                          onPressed: () => controller.signInGoogleAuth(),
                          darkMode: true,
                          style: const AuthButtonStyle(
                              buttonType: AuthButtonType.icon,
                              width: 80,
                              height: 80,
                              iconSize: 50),
                        ),

                        FacebookAuthButton(
                          onPressed: () => controller.signInFacebook(),
                          darkMode: true,
                          style: const AuthButtonStyle(
                              buttonType: AuthButtonType.icon,
                              width: 80,
                              height: 80,
                              iconSize: 50),
                        ),
                        Container(
                            width: 80,
                            height: 80,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white54,
                              ),
                              onPressed: () => controller.faceID(),
                              child: const FadeInImage(
                                image: AssetImage('assets/images/face-id.png'),
                                placeholder:
                                    AssetImage('assets/images/face-id.png'),
                                width: 80,
                                height: 80,
                              ),
                            )),
                        // SizedBox(height: 20),
                        // Text(
                        //   'Ingresa con Face ID',
                        //   style: TextStyle(fontWeight: FontWeight.bold),
                        // ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GoogleAuthButton(
                          onPressed: () => controller.signInGoogleAuth(),
                          darkMode: true,
                          style: const AuthButtonStyle(
                              buttonType: AuthButtonType.icon,
                              width: 80,
                              height: 80,
                              iconSize: 50),
                        ),
                        SizedBox(width: 30),
                        FacebookAuthButton(
                          onPressed: () => controller.signInFacebook(),
                          darkMode: true,
                          style: const AuthButtonStyle(
                              buttonType: AuthButtonType.icon,
                              width: 80,
                              height: 80,
                              iconSize: 50),
                        ),
                      ],
                    )
            ],
          ),
          const SizedBox(height: 30),
          Center(
              child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "No tienes cuenta?",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.blue,
                ),
                child: const Text(
                  "Registrate",
                ),
                onPressed: () => controller.goToSignup(),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              // Text(
              //   "No tienes cuenta?",
              //   style: Theme.of(context).textTheme.bodyText1,
              // ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.blue,
                ),
                child: const Text(
                  "Tengo un c??digo",
                ),
                onPressed: () => controller.goToSignup(),
              ),
            ])
          ])),
          const SizedBox(height: 5)
        ]).paddingAll(10));
  }
}
