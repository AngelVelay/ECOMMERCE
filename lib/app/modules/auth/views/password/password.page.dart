import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/form-controls/custom-rounded-button.widget.dart';
import 'package:jexpoints/app/modules/auth/views/password/password.controller.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class PasswordPage extends GetView<PasswordController> {
  final format = DateFormat("dd/MM/yyyy");

  PasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Finalizar registro'),
            backgroundColor: Color(0xff2222222),
            foregroundColor: Colors.white),
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
            border: Border.all(color: Colors.white, width: 3),
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
                    labelText: 'Contraseña',
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(Icons.vpn_key, color: Colors.white)),
                validator: FormBuilderValidators.required(),
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              FormBuilderTextField(
                name: 'confirmPassword',
                controller: controller.confirmPasswordTextCtrl,
                decoration: const InputDecoration(
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
                    labelText: 'Confirmación de Contraseña',
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(Icons.vpn_key, color: Colors.white)),
                validator: (value) {
                  return controller.confirmValidate();
                },
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              DateTimeField(
                format: format,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    )),
                    labelText: 'Fecha de Nacimiento (Opcional)',
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIcon:
                        Icon(Icons.calendar_month, color: Colors.white)),
                onChanged: (value) => controller.onBirthdateChange(value),
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100),
                      cancelText: 'Cancelar',
                      confirmText: 'Aceptar',
                      helpText: 'Fecha de Nacimiento');
                },
              ),
              _button(context)
            ])));
  }

  Widget _button(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
      width: double.infinity,
      child: Obx(() {
        return CustomRoundedButton(
            text: controller.isLoading.value
                ? 'REGISTRANDO...'
                : 'COMPLETAR REGISTRO',
            onPressed: () => controller.signUpStepThree());
      }),
    );
  }
}
