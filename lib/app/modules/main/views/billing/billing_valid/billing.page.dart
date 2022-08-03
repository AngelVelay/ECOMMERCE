
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/form-controls/custom-rounded-button.widget.dart';

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
          radius: 70,
          backgroundImage: AssetImage('assets/images/valid.jpg')));
}
// Widget _imageWidget(BuildContext context) {
//   return Center(
//       child: Column(children: [
//     Container(
//         width: 120,
//         height: 120,
//         child: const Icon(
//           Icons.add_a_photo,
//           size: 60,
//           color: Colors.grey,
//         ),
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: Border.all(color: Colors.white, width: 3),
//           // icon: Icon(Icons.add_photo_alternate_rounded)),
//         ))
//   ]));
 
// }

Widget _formWidget(BuildContext context, BillingController controller) {
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
                  labelText: 'Tienda',
                  labelStyle: TextStyle(color: Colors.white),
                  suffixIcon: Icon(
                    Icons.store,
                    color: Colors.white,
                  )),
              validator: FormBuilderValidators.required(),
              keyboardType: TextInputType.text,
            ),
            FormBuilderTextField(
              name: 'mount',
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
                  labelText: 'Monto',
                  labelStyle: TextStyle(color: Colors.white),
                  suffixIcon: Icon(
                    Icons.monetization_on,
                    color: Colors.white,
                  )),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.email(),
                FormBuilderValidators.required(),
              ]),
              keyboardType: TextInputType.emailAddress,
            ),
            FormBuilderTextField(
              name: 'ticket',
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
                  labelText: 'No.de Ticket ',
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
                
                    text: 'Validar'.toUpperCase(),
                    onPressed: () => controller.send())),
                      Row(
                          

                        
                      )
          ],
        ),
      ));
}
