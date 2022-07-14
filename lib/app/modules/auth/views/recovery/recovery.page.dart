import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/form-controls/custom-button.widget.dart';
import '../../../../components/form-controls/custom-rounded-button.widget.dart';
import 'recovery.controller.dart';

class RecoveryPasswordPage extends GetView<RecoveryPasswordController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(children: [
      const Spacer(),
      Row(children: [
        Text("Ingresa tu correo electrónico",
            style: Theme.of(context).textTheme.headline4)
      ]).paddingOnly(bottom: 20),
      TextField(
        obscureText: false,
        controller: controller.email,
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
            width: 2.0,
          )),
          labelText: "Correo Electrónico",
          labelStyle: TextStyle(color: Colors.white),
        ),
      ),
      SizedBox(
        width: double.infinity,
        child: CustomRoundedButton(
            text: 'Recuperar', onPressed: () => controller.send()),
      ).paddingOnly(top: 16),
      const Spacer(),
      Center(
        child: TextButton(
            child: Text(
              'Cancelar',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onPressed: () => Navigator.pop(context)),
      )
    ]).paddingAll(16)));
  }
}
