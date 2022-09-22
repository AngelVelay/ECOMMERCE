import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/button/custom_button_transparent.dart';
import 'package:jexpoints/app/components/circle_icon_button/circle_icon_button.dart';
import 'package:jexpoints/app/components/circular-progress-bar/circular-progress-bar.dart';
import 'package:jexpoints/app/components/form-controls/custom-input-hidden.widget.dart';
import 'package:jexpoints/app/components/form-controls/custom-input-text.widget.dart';
import 'package:jexpoints/app/components/form-controls/custom-rounded-button.widget.dart';
import 'package:jexpoints/app/core/utils/image-picker.utils.dart';
import 'user-detail.controller.dart';

class UserDetailPage extends GetView<UserDetailController> {
  const UserDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Datos de usuario'),
        ),
        body: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return FormBuilder(
        key: controller.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 100,
            child: Column(
              children: [
                Stack(children: [
                  const CircleAvatar(
                    radius: 50, // Image radius
                    backgroundImage:
                        AssetImage('assets/images/female-07.jpg'), // Image URL
                  ),
                  Positioned(
                      top: 68,
                      left: 68,
                      child: CircleIconButton(
                        iconData: Icons.edit,
                        size: 32,
                        onPressed: () => controller.imagePick(context),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ))
                ]),
                const CustomInputHidden('id'),
                const SizedBox(height: 20),
                CustomInputText(
                  'username',
                  'Usuario',
                  validator: FormBuilderValidators.required(),
                ),
                const SizedBox(height: 20),
                CustomInputText(
                  'name',
                  'Nombre',
                  validator: FormBuilderValidators.required(),
                ),
                const SizedBox(height: 20),
                CustomInputText(
                  'phoneNumber',
                  'Teléfono',
                  validator: FormBuilderValidators.required(),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ButtonTransparent(
                    paddingHorizontal: 20,
                    paddingVertical: 10,
                    text: 'Guardar',
                    onPressed: () => controller.save(),
                  ),
                )
              ],
            ),
          ),
        )));
  }
}
