import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/form-controls/custom-button.widget.dart';
import 'package:jexpoints/app/shared/values/assets.globals.dart';
import '../../../../components/form-controls/custom-rounded-button.widget.dart';
import '../../../main/main.module.dart';

class SignupSuccessPage extends StatelessWidget {
  const SignupSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Spacer(flex: 1),
          _imageWidget(context),
          const SizedBox(height: 8),
          _headerWidget(context),
          const Spacer(flex: 1),
          _verifyButtonWidget(context),
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
          radius: 70, backgroundImage: AssetImage(GlobalAssets.logo)));
}

Widget _headerWidget(BuildContext context) {
  return Column(children: const [
    SizedBox(height: 20),
    Text(
      '¡¡¡FELICIDADES!!!',
      style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
      textAlign: TextAlign.center,
    ),
    SizedBox(
      height: 20,
    ),
    Text(
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown ',
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
      textAlign: TextAlign.center,
    ),
  ]);
}

Widget _verifyButtonWidget(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
    child: CustomRoundedButton(
        text: 'Comenzar'.toUpperCase(),
        onPressed: () {
          Get.toNamed(MainRouting.MAIN_ROUTE);
        }),
  );
}
