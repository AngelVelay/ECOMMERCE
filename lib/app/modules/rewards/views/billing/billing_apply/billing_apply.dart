import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/inputs/custom_select.widget.dart';
import 'package:jexpoints/app/modules/auth/entities/branch.type.dart';
import 'package:jexpoints/app/modules/rewards/views/billing/billing_apply/billing_apply.controller.dart';
import '../../../../../components/custom_input/custom_input.dart';
import '../../../../../components/form-controls/custom-rounded-button.widget.dart';
import '../billing_layout/billing-layout.page.dart';

class BillingApplyPage extends GetView<BillingApplyController> {
  @override
  const BillingApplyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos de Facturación'),
        backgroundColor: const Color(0xff2222222),
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
              // _imageWidget(context),
              const SizedBox(height: 20),
              _formWidget(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageWidget(BuildContext context) {
    return const CircleAvatar(
        radius: 80,
        backgroundColor: Colors.blueGrey,
        child: CircleAvatar(
            radius: 70, backgroundImage: AssetImage('/assets/images/fac.png')));
  }

  Widget _formWidget(BuildContext context) {
    return FormBuilder(
        key: controller.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
          child: Wrap(
            runSpacing: 20,
            children: <Widget>[
              CustomInputField(
                maxLength: 16,
                inputFormatter: FilteringTextInputFormatter.allow(
                    RegExp(r'[A-Z,a-z," ",0-9]')),
                controller: controller.rfc,
                keyboardType: TextInputType.number,
                labelText: 'RFC',
                prefixIcon: Icons.person_outline_outlined,
              ),
              CustomInputField(
                maxLength: 16,
                inputFormatter: FilteringTextInputFormatter.allow(
                    RegExp(r'[A-Z,a-z," ",0-9]')),
                controller: controller.razonSocial,
                keyboardType: TextInputType.text,
                labelText: 'Razon Social',
                prefixIcon: Icons.person_outline_outlined,
              ),
              CustomInputField(
                maxLength: 16,
                inputFormatter: FilteringTextInputFormatter.allow(
                    RegExp(r'[A-Z,a-z," ",0-9]')),
                controller: controller.correo,
                keyboardType: TextInputType.emailAddress,
                labelText: 'Correo',
                prefixIcon: Icons.person_outline_outlined,
              ),
              CustomInputField(
                maxLength: 16,
                inputFormatter:
                    FilteringTextInputFormatter.allow(RegExp(r'[A-Z,a-z," "]')),
                controller: controller.cfdi,
                keyboardType: TextInputType.number,
                labelText: 'CFDI',
                prefixIcon: Icons.person_outline_outlined,
              ),
              SizedBox(
                  width: double.infinity,
                  child: CustomRoundedButton(
                    text: 'Generar Factura'.toUpperCase(),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BillingLayout()));
                    },
                  )),
              Row()
            ],
          ),
        ));
  }

  Widget _branchSelect() {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButtonFormField<String>(
          hint: const Text('Tipo de Factura',
              style: TextStyle(color: Colors.white)),
          focusColor: Colors.white,
          isExpanded: true,
          items: controller.billingType.map<DropdownMenuItem<String>>((value) {
            return DropdownMenuItem<String>(
              value: '${value.values}',
              child: Text(
                value.values.last.toString().toUpperCase(),
                style: const TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
          onChanged: (value) => controller.selectedId$.value = value!,
          style: const TextStyle(color: Colors.white),
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
            labelText: 'Tipo de Factura',
            labelStyle: TextStyle(color: Colors.white),
          ),
        ),
      );
    });
  }
}


// int selectedStateId = 0;
// int selectedCityId = 0;

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {

//  @override
//   Widget _buildDropdown(BuildContext context,BillingApplyController controller) {
//     return  DropdownButtonFormField<int>(
//               key: UniqueKey(),
//               decoration: InputDecoration(labelText: 'City'),
//               icon: const Icon(Icons.arrow_downward),
//               value: selectedStateId,
//               elevation: 16,
//                onChanged: (int? newValue) {
//                 setState(() {
//                   selectedStateId = newValue!;
//                 });
//               },
                  
//               items: controller.branchList.map((e) => DropdownMenuItem(
//                 child:Text(e.name),
//                 value: e.id)
//               ).toList()
            
//             );
          
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }