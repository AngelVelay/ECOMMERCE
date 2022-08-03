import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.contract.dart';
import 'package:jexpoints/app/modules/main/main.module.dart';

class BillingController extends GetxController{
final formKey =GlobalKey<FormBuilderState>();
late IAuthService _authService;


BillingController(IAuthService authService){
  _authService=authService;
}
  
    @override
      void onInit() {
        super.onInit();
      }


    goToHaveCode() {
        //Get.toNamed(RegisterRouting.HAVE_CODE);
      }


    send()
    {
     Get.toNamed(MainRouting.BILLING_APPLY_ROUTE);
    }















}