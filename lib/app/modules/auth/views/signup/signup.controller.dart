import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:jexpoints/app/core/utils/msg.utils.dart';
import 'package:jexpoints/app/modules/auth/entities/user-data.type.dart';
import '../../auth.module.dart';
import '../../services/auth/auth.contract.dart';
import '../../entities/signup.type.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  late IAuthService _authService;
  bool isLoading = false;
  bool isValidating = false;
  String successMessage = '';
  String registrationCode = '';
  String validationCode = '';
  UserData userData =
      UserData(id: '', password: '', passwordSalt: '', username: '');

  SignupController(IAuthService authService) {
    _authService = authService;
  }

  @override
  void onInit() {
    super.onInit();

    // signUpStepOne();
  }

  signUpStepOne() async {
    // _authService.signUp(formKey.currentState!.value as Signup).then((value) => {
    //       if (value != null)
    //         {formKey.currentState!.value['email'] = value.email}
    //       else
    //         {MsgUtils.error('Error al registrar el usuario', title: 'Error')}
    //     });
    _authService
        .signUp(Signup(
      password: '',
      email: formKey.currentState?.value['email'],
      name: formKey.currentState?.value['name'],
      phoneNumber: formKey.currentState?.value['phoneNumber'],
      registrationCode: '',
      userData: UserData(id: '', password: '', passwordSalt: '', username: ''),
      validationCode: '',
    ))
        .then((value) {
      if (value != null) {
        registrationCode = value.registrationCode;
        validationCode = value.validationCode;
        MsgUtils.success(
            "Se ha enviado un código de verificación a su correo electrónico.",
            title: 'Código enviado');
      } else {
        MsgUtils.error(
          'No se pudo enviar el código de verificación.',
        );
      }
    });
  }

  signUpStepTwo() async {
    _authService
        .signUp(Signup(
      password: formKey.currentState!.value['password'],
      email: formKey.currentState!.value['email'],
      name: formKey.currentState!.value['name'],
      phoneNumber: formKey.currentState!.value['phoneNumber'],
      registrationCode: registrationCode,
      userData: UserData(id: '', password: '', passwordSalt: '', username: ''),
      validationCode: validationCode,
    ))
        .then((value) {
      if (value != null) {
        registrationCode = value.registrationCode;
        validationCode = value.validationCode;
        MsgUtils.success(
          'Registro exitoso',
        );
      } else {
        MsgUtils.error(
          'Error en el registro',
        );
      }
    });
    // isValidating = true;
    // _authService
    //     .signUp(formKey.currentState!.value as Signup)
    //     .then((response) {})
    //     .catchError((error) => {MsgUtils.error(error.toString())})
    //     .whenComplete(() => {isValidating = false});
  }

  signUpStepThree() async {
    _authService
        .signUp(Signup(
      password: formKey.currentState!.value['password'],
      email: formKey.currentState!.value['email'],
      name: formKey.currentState!.value['name'],
      phoneNumber: formKey.currentState!.value['phoneNumber'],
      registrationCode: registrationCode,
      userData: userData,
      validationCode: validationCode,
    ))
        .then((value) {
      if (value != null) {
        userData = UserData(
            id: value.id,
            password: value.password,
            passwordSalt: value.passwordSalt,
            username: value.username);
        MsgUtils.success(
          'Registro exitoso',
        );
      } else {
        MsgUtils.error(
          'Error en el registro',
        );
      }
    }).whenComplete(() => {MsgUtils.success('Felicidades ,registro exitoso')});
    // _authService.signUp(formKey.currentState!.value as Signup).then((response) {
    //   successMessage = 'Registro realizado con exito';
    // }).catchError((error) => {MsgUtils.error(error.toString())});
  }

  // onOtpChange(String otp) {
  //   if (otp.length == 5) {
  //     formKey.currentState!.value['registrationCode'] = otp;
  //     signUpStepTwo();
  //   }
  // }

  send() async {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      var signupUser = Signup.fromJson(formKey.currentState!.value);
      await _authService.signUp(signupUser);
      Get.toNamed(AuthRouting.VERIFICATION_ROUTE);
    } else {
      MsgUtils.error('Verifique los campos');
    }
  }
}
