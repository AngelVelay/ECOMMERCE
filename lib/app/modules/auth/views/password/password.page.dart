import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/form-controls/custom-rounded-button.widget.dart';
import 'package:jexpoints/app/modules/auth/views/password/password.controller.dart';
import 'package:jexpoints/app/components/button/custom_button.widget.dart';

class PasswordPage extends GetView<PasswordController> {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Finalizar registro'),
            backgroundColor: Colors.white70,
            foregroundColor: Colors.black87),
        body: Column(children: [
          const SizedBox(height: 30),
          _image(context),
          const SizedBox(height: 30),
          _form(context),
          // const SizedBox(height: 10),
          // _button(context),
        ]));
  }

  Widget _image(BuildContext context) {
    return Center(
        child: Column(children: [
      Container(
          width: 120,
          height: 120,
          child: const Icon(
            Icons.security,
            size: 60,
            color: Colors.grey,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black38, width: 3),
          ))
    ]));
  }

  Widget _form(BuildContext context) {
    return FormBuilder(
        key: controller.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Wrap(runSpacing: 20, children: <Widget>[
              FormBuilderTextField(
                name: 'password',
                controller: controller.passwordTextCtrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contraseña',
                    suffixIcon: Icon(Icons.vpn_key)),
                validator: FormBuilderValidators.required(),
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              FormBuilderTextField(
                name: 'confirmPassword',
                controller: controller.confirmPasswordTextCtrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirmación de Contraseña',
                    suffixIcon: Icon(Icons.vpn_key)),
                validator: (value) {
                  return controller.confirmValidate();
                },
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              _button(context)
            ])));
  }

  Widget _button(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
      width: double.infinity,
      child: CustomRoundedButton(
          text: 'ENVIAR', onPressed: () => controller.save()),
    );
  }
}
