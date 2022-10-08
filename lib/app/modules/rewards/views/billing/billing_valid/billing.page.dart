import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/form-controls/custom-rounded-button.widget.dart';

import '../../../../../components/custom_input/custom_input.dart';
import '../../../../auth/entities/branch.type.dart';
import 'billing.controller.dart';

class BillingPage extends GetView<BillingController> {
  const BillingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Facturación'),
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
              const SizedBox(height: 20),
              _branchSelect(context, controller),
              _formWidget(context, controller)
            ],
          ),
        ),
      ),
    );
  }
}

Widget _imageWidget(BuildContext context) {
  return const CircleAvatar(
      radius: 80,
      backgroundColor: Colors.blueGrey,
      child: CircleAvatar(
          radius: 70, backgroundImage: AssetImage('assets/images/valid.jpg')));
}

Widget _formWidget(BuildContext context, BillingController controller) {
  return FormBuilder(
      key: controller.formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
        child: Wrap(
          runSpacing: 20,
          children: <Widget>[
            CustomInputField(
              inputFormatter:
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              controller: controller.monto,
              keyboardType: TextInputType.number,
              labelText: 'Monto',
              suffixIcon: Icons.attach_money_rounded,
            ),
            CustomInputField(
              maxLength: 16,
              inputFormatter:
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              controller: controller.ticket,
              keyboardType: TextInputType.number,
              labelText: 'Numero de Ticket',
              suffixIcon: Icons.confirmation_number_rounded,
            ),
            SizedBox(
                width: double.infinity,
                child: CustomRoundedButton(
                    text: 'Validar'.toUpperCase(),
                    onPressed: () => controller.send())),
            Row()
          ],
        ),
      ));
}

Widget _branchSelect(context, controller) {
  return Obx(() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButtonFormField<String>(
          hint: const Text('Selecciona una Sucursal',
              style: TextStyle(color: Colors.white)),
          icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
          focusColor: Colors.white,
          isExpanded: true,
          items: controller.branchList.value
              .map<DropdownMenuItem<String>>((Branch option) {
            return DropdownMenuItem<String>(
              value: '${option.id}',
              child: Text(
                option.name,
                style: const TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
          onChanged: (value) => controller.selectedId.value = value!,
          style: const TextStyle(color: Colors.white),
          dropdownColor: Colors.white,
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
            labelText: 'Sucursal',
            labelStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  });
}
