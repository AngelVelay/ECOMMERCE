import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/form-controls/custom-rounded-button.widget.dart';
import 'signup.controller.dart';

class SignupPage extends GetView<SignupController> {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de usuario'),
        backgroundColor: Color(0xff2222222),
        foregroundColor: Colors.white,
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
          border: Border.all(color: Colors.white, width: 3),
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
                  labelText: 'Nombre',
                  labelStyle: TextStyle(color: Colors.white),
                  suffixIcon: Icon(
                    Icons.person,
                    color: Colors.white,
                  )),
              validator: FormBuilderValidators.required(),
              keyboardType: TextInputType.text,
            ),
            FormBuilderTextField(
              name: 'email',
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
                  labelText: 'Correo Electrónico',
                  labelStyle: TextStyle(color: Colors.white),
                  suffixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  )),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.email(),
                FormBuilderValidators.required(),
              ]),
              keyboardType: TextInputType.emailAddress,
            ),
            FormBuilderTextField(
              name: 'phoneNumber',
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
                  labelText: 'Teléfono',
                  labelStyle: TextStyle(color: Colors.white),
                  suffixIcon: Icon(
                    Icons.phone,
                    color: Colors.white,
                  )),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.numeric(),
                FormBuilderValidators.required(),
              ]),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
                width: double.infinity,
                child: CustomRoundedButton(
                    text: 'Guardar'.toUpperCase(),
                    onPressed: () => controller.send()))
          ],
        ),
      ));
}
