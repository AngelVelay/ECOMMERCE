import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/form-controls/custom-button.widget.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.contract.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.fake.service.dart';
import 'package:jexpoints/app/shared/values/assets.globals.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'verification.controller.dart';

class VerificationPage extends GetView<VerificationController> {
  // @override
  // late VerificationController controller;

  VerificationPage({Key? key}) : super(key: key) {
    // controller = Get.put(VerificationController(authService));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificación'),
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
              const SizedBox(height: 8),
              _headerWidget(context, controller),
              const SizedBox(height: 20),
              _codeWidget(context, controller),
              const SizedBox(height: 20),
              _footerWidget(context, controller),
              const SizedBox(height: 14),
              _verifyButtonWidget(context, controller),
              const SizedBox(height: 16),
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
          backgroundImage: AssetImage('assets/images/esperanza_logo.png')
    )
  );
}

Widget _headerWidget(BuildContext context, VerificationController controller) {
  return Column(children: [
    const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        'Verificación de código',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        textAlign: TextAlign.center,
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
      child: RichText(
        text: TextSpan(
            text: "Ingresa el código enviado al ",
            children: [
              TextSpan(
                  text: controller.phoneNumber,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
            ],
            style: const TextStyle(color: Colors.black54, fontSize: 15)),
        textAlign: TextAlign.center,
      ),
    )
  ]);
}

Widget _codeWidget(BuildContext context, VerificationController controller) {
  return Form(
    key: controller.formKey,
    child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 70),
        child: PinCodeTextField(
          appContext: context,
          pastedTextStyle: TextStyle(
            color: Colors.green.shade300,
            fontWeight: FontWeight.bold,
          ),
          length: 5,
          obscureText: true,
          obscuringCharacter: '*',
          // obscuringWidget: const FlutterLogo(
          //   size: 24,
          // ),
          blinkWhenObscuring: true,
          animationType: AnimationType.fade,
          validator: (v) {
            if (v!.length < 3) {
              return "Ingrese el código";
            } else {
              return null;
            }
          },
          pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 40,
              activeFillColor: Colors.white,
              inactiveFillColor: Colors.white54),
          cursorColor: Colors.black,
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          errorAnimationController: controller.errorController,
          controller: controller.textEditingController,
          keyboardType: TextInputType.number,
          boxShadows: const [
            BoxShadow(
              offset: Offset(0, 1),
              color: Colors.black12,
              blurRadius: 10,
            )
          ],
          onCompleted: (v) => controller.validate(),
          // onTap: () {
          //   print("Pressed");
          // },
          onChanged: (value) {},
          // beforeTextPaste: (value) => {
          //     print(value);
          // },
        )),
  );
}

Widget _footerWidget(BuildContext context, VerificationController controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "¿No recibiste el código? ",
        style: TextStyle(color: Colors.black54, fontSize: 15),
      ),
      TextButton(
        onPressed: () => controller.resend(),
        child: const Text(
          "Volver a enviar",
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      )
    ],
  );
}

Widget _verifyButtonWidget(
    BuildContext context, VerificationController controller) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
    child: CustomButton(
        text: 'Verificar'.toUpperCase(),
        onPressed: () => controller.validate()),
  );
}
