import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/button/custom_button_transparent.dart';
import 'package:jexpoints/app/components/form-controls/custom-input-check.widget.dart';
import 'package:jexpoints/app/components/form-controls/custom-input-hidden.widget.dart';
import 'package:jexpoints/app/components/form-controls/custom-input-text.widget.dart';
import 'package:jexpoints/app/components/form-controls/custom-rounded-button.widget.dart';
import 'address-detail.controller.dart';

class AddressDetailPage extends GetView<AddressDetailController> {
  const AddressDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text(controller.address$.value.id == 0
              ? 'Agregar Direccion'
              : controller.address$.value.alias),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomInputHidden('id',
                          initialValue: controller.address$.value.id),
                      CustomInputText('alias', 'Alias',
                          // validator: FormBuilderValidators.required(),
                          initialValue: controller.address$.value.alias),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: CustomInputText(
                              'contactName',
                              'Contacto',
                              // validator: FormBuilderValidators.required(),
                              initialValue:
                                  controller.address$.value.contactName,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomInputText(
                              'contactPhone',
                              'N??mero de contacto',
                              // validator: FormBuilderValidators.required(),
                              keyboardType: TextInputType.phone,
                              initialValue: controller
                                  .address$.value.contactPhone
                                  .toString(),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomInputText('street', 'Calle',
                          // validator: FormBuilderValidators.required(),
                          initialValue: controller.address$.value.street),
                      const SizedBox(height: 15),
                      Row(children: [
                        Expanded(
                          child: CustomInputText(
                              'outsideNumber', 'Numero Exterior',
                              // validator: FormBuilderValidators.required(),
                              initialValue:
                                  controller.address$.value.outsideNumber),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomInputText('insideNumber', 'Numero Int',
                              initialValue:
                                  controller.address$.value.insidelNumber),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomInputText(
                            'zipCode',
                            'C??digo Postal',
                            initialValue:
                                controller.address$.value.zipcode.toString(),
                            // validator: FormBuilderValidators.required(),
                            keyboardType: TextInputType.number,
                          ),
                        )
                      ]),
                      const SizedBox(height: 15),
                      Row(children: [
                        Expanded(
                          child: CustomInputText('suburb', 'Colonia',
                              // validator: FormBuilderValidators.required(),
                              initialValue: controller.address$.value.suburb),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomInputText('town', 'Municipio',
                              // validator: FormBuilderValidators.required(),
                              initialValue: controller.address$.value.town),
                        ),
                      ]),
                      const SizedBox(height: 15),
                      Row(children: [
                        Expanded(
                          child: CustomInputText('state', 'Estado',
                              // validator: FormBuilderValidators.required(),
                              initialValue: controller.address$.value.state),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomInputText('country', 'Pais',
                              // validator: FormBuilderValidators.required(),
                              initialValue: controller.address$.value.country),
                        ),
                      ]),
                      const SizedBox(height: 15),
                      CustomInputText('streetNotes', 'Entre calles',
                          initialValue: controller.address$.value.streetNotes),
                      const SizedBox(height: 15),
                      CustomInputText('notes', 'notas adicionales',
                          initialValue: controller.address$.value.streetNotes),
                      CustomInputCheck('isDefault', 'Domicilio Predeterminado',
                          initialValue: controller.address$.value.isDefault),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ButtonTransparent(
                      paddingHorizontal: 20.0,
                      paddingVertical: 0,
                      text: 'Guardar',
                      onPressed: () {
                        controller.save();
                      },
                    ),
                  ),
                ],
              )),
        )));
  }
}
