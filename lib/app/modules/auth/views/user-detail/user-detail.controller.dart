import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/core/utils/image-picker.utils.dart';
import 'package:jexpoints/app/core/utils/msg.utils.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.contract.dart';

import '../../entities/user-data.type.dart';

class UserDetailController extends GetxController {
  final IAuthService _authService;
  final formKey = GlobalKey<FormBuilderState>();
  var user$ = UserData.fromVoid().obs;

  UserDetailController(this._authService);

  @override
  void onInit() async {
    super.onInit();

    var checkUser = await _authService.checkUser();
    user$.value = checkUser!;
    formKey.currentState?.patchValue(checkUser.toJson());
    print(checkUser.toJson());
  }

  save() async {
    formKey.currentState?.save();
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      Get.back();
      MsgUtils.success('Datos actualizados correctamente');
    }
  }

  imagePick(BuildContext context) {
    ImagePickerUtils.pick(context, imagePickComplete);
  }

  imagePickComplete() {
    print('Ya seleccione y ahora que?');
  }
}
