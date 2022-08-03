import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/inputs/custom_select.widget.dart';
import 'package:jexpoints/app/modules/auth/entities/branch.type.dart';
import 'package:jexpoints/app/modules/main/views/billing/billing_apply/billing_apply.controller.dart';
import '../../../../../components/form-controls/custom-rounded-button.widget.dart';

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
              _branchSelect(),

              // DropdownButtonFormField<int>(
              //       key: UniqueKey(),
              //       decoration: InputDecoration(labelText: 'Tienda'),
              //       icon: const Icon(Icons.arrow_downward),
              //       value: selectedStateId,
              //       elevation: 16,
              //        onChanged: (int? newValue) {
              //         //setState(() {
              //           selectedStateId = newValue!;
              //         //});
              //       },

              //       items: controller.branchList.map((e) => DropdownMenuItem(
              //         child:Text(e.name),
              //         value: e.id)
              //       ).toList()

              //     ),

              FormBuilderTextField(
                name: 'rfc',
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    // enabledBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(
                    //     color: Colors.white,
                    //     width: 2.0,
                    //   ),
                    // ),
                    // focusedBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(
                    //     color: Colors.white,
                    //     width: 2.0,
                    //   ),
                    // ),
                    labelText: 'RFC',
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(
                      Icons.account_tree_outlined,
                      color: Colors.white,
                    )),
                validator: FormBuilderValidators.required(),
                keyboardType: TextInputType.text,
              ),
              FormBuilderTextField(
                name: 'business',
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
                    labelText: 'Razon Social',
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(
                      Icons.store,
                      color: Colors.white,
                    )),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.email(),
                  FormBuilderValidators.required(),
                ]),
                keyboardType: TextInputType.emailAddress,
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
                    labelText: 'Correo',
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(
                      Icons.mail_outlined,
                      color: Colors.white,
                    )),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.required(),
                ]),
                keyboardType: TextInputType.number,
              ),
              FormBuilderTextField(
                name: 'cfdi',
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
                    labelText: 'CFDI',
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(
                      Icons.format_list_numbered,
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
                      text: 'Generar Factura'.toUpperCase(),
                      onPressed: () => controller.send())),
              Row()
            ],
          ),
        ));
  }

  Widget _branchSelect() {
    return Obx(() {
      return DropdownButtonFormField<String>(
        isExpanded: true,
        items: controller.branchList.value
            .map<DropdownMenuItem<String>>((Branch option) {
          return DropdownMenuItem<String>(
            value: '${option.id}',
            child: Text(option.name),
          );
        }).toList(),
        onChanged: (value) => controller.selectedId.value = value!,
        style: const TextStyle(color: Colors.black87),
        decoration: const InputDecoration(
          labelText: 'Sucursal',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(),
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