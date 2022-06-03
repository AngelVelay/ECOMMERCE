import 'dart:io';

import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/form-controls/custom-button.widget.dart';
import '../recovery/recovery.page.dart';
import 'login.controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      const Spacer(),
      const CircleAvatar(
          radius: 80,
          backgroundColor: Colors.blueGrey,
          child: CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/esperanza_logo.png'))),
      const SizedBox(height: 20),
      TextField(
        obscureText: false,
        controller: controller.username,
        decoration:
            InputDecoration(border: OutlineInputBorder(), labelText: "Usuario"),
      ),
      TextField(
        obscureText: true,
        controller: controller.password,
        decoration: InputDecoration(
            border: OutlineInputBorder(), labelText: "Contraseña"),
      ).paddingOnly(top: 16),
      Container(
          alignment: Alignment.centerRight,
          child: TextButton(
            child: Text(
              "¿Olvidaste tu contraseña?",
              style: TextStyle(color: Colors.black87),
            ),
            onPressed: () => {
              showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return RecoveryPasswordPage();
                  }),
            },
          )),
      Container(
          width: double.infinity,
          child: Obx(() {
            return CustomButton(
                text: '${controller.loginText}',
                onPressed: () => controller.singIn());
          })),
      Spacer(),
      Column(
        children: [
          Text('Ingresa tambien con:'),
          SizedBox(height: 20),
          Platform.isIOS
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          child: FadeInImage(
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
      const SizedBox(height: 80),
      Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
        ],
      )),
      const SizedBox(height: 10)
    ]).paddingAll(20));
  }
}
