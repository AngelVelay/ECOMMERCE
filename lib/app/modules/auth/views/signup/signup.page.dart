import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/form-controls/custom-rounded-button.widget.dart';
import '../../services/auth/auth.contract.dart';
import 'signup.controller.dart';

class SignupPage extends GetView<SignupController> {
  // @override
  // late SignupController controller;

  // SignupPage(IAuthService authService, {Key? key}) : super(key: key) {
  //   controller = Get.put(SignupController(authService));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de usuario'),
        backgroundColor: Colors.white70,
        foregroundColor: Colors.black87,
      ),
      body: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 30),
              _imageWidget(context),
              const SizedBox(height: 10),
              _formWidget(context, controller)
            ],
          ),
        ),
      ),
    );
  }
}

Widget _imageWidget(BuildContext context) {
  return Center(
      child: Column(children: [
    Container(
        width: 120,
        height: 120,
        child: const Icon(
          Icons.add_a_photo,
          size: 60,
          color: Colors.grey,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black38, width: 3),
          // icon: Icon(Icons.add_photo_alternate_rounded)),
        ))
  ]));
  //  SizedBox(
  //   height: MediaQuery.of(context).size.height / 4,
  //   child: ClipRRect(
  //     borderRadius: BorderRadius.circular(
  //       30,
  //     ),
  //     child: Image.asset(GlobalAssets.profile),
  //   ),
  // );
}

Widget _formWidget(BuildContext context, SignupController controller) {
  return FormBuilder(
      key: controller.formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
        child: Wrap(
          runSpacing: 20,
          children: <Widget>[
            FormBuilderTextField(
              name: 'name',
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombre',
                  suffixIcon: Icon(Icons.person)),
              validator: FormBuilderValidators.required(),
              keyboardType: TextInputType.text,
            ),
            FormBuilderTextField(
              name: 'email',
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Correo Electrónico',
                  suffixIcon: Icon(Icons.email)),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.email(),
                FormBuilderValidators.required(),
              ]),
              keyboardType: TextInputType.emailAddress,
            ),
            FormBuilderTextField(
              name: 'phoneNumber',
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Teléfono',
                  suffixIcon: Icon(Icons.phone)),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.numeric(),
                FormBuilderValidators.required(),
              ]),
              keyboardType: TextInputType.number,
            ),
            // FormBuilderTextField(
            //   name: 'password',
            //   decoration: const InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Contraseña',
            //       suffixIcon: Icon(Icons.vpn_key)),
            //   validator: FormBuilderValidators.required(),
            //   keyboardType: TextInputType.text,
            // ),
            // FormBuilderTextField(
            //   name: 'confirmPassword',
            //   decoration: const InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Confirmación de Contraseña',
            //       suffixIcon: Icon(Icons.vpn_key)),
            //   validator: FormBuilderValidators.required(),
            //   keyboardType: TextInputType.text,
            // ),
            // const SizedBox(
            //   height: 70,
            // ),
            SizedBox(
                width: double.infinity,
                child: CustomRoundedButton(
                    text: 'Guardar'.toUpperCase(),
                    onPressed: () => controller.send()))
          ],
        ),
      ));
}
