import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/form-controls/custom-button.widget.dart';
import 'package:jexpoints/app/modules/main/main.module.dart';
import 'package:jexpoints/app/shared/values/assets.globals.dart';
import '../verification/verification.controller.dart';

class VerificationSuccessPage extends GetView<VerificationController> {
  const VerificationSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Spacer(flex: 1),
          _imageWidget(context),
          const SizedBox(height: 8),
          _headerWidget(context, controller),
          const Spacer(flex: 1),
          _verifyButtonWidget(context, controller),
          const SizedBox(height: 30),              
        ],
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
          backgroundImage: AssetImage(GlobalAssets.logo)
    )
  );
}

Widget _headerWidget(BuildContext context, VerificationController controller) {
  return Column(children: const[
    SizedBox(height: 20),
    Text(
      '¡¡¡FELICIDADES!!!',
      style: TextStyle(fontSize: 30),
      textAlign: TextAlign.center,      
    ),
    SizedBox(height: 20,),
    Text(
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown ',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      textAlign: TextAlign.center,      
    ),    
  ]);
}

Widget _verifyButtonWidget(BuildContext context, VerificationController controller) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),    
    child: CustomButton(
        text: 'Comenzar'.toUpperCase(),
        onPressed: (){          
          controller.goToHome();
        }
    ),
  );
}
