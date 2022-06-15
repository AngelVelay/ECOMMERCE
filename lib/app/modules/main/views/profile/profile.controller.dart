import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/core/utils/storage.utils.dart';
import 'package:jexpoints/app/shared/values/globals.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../components/map_ubication/map_ubication.dart';
import '../../../auth/auth.module.dart';
import '../../../auth/entities/user.type.dart';
import '../../../auth/services/auth/auth.contract.dart';

class ProfileController extends GetxController {
  late IAuthService _repo;
  var user = User.fromVoid().obs;

  ProfileController(this._repo);

  @override
  void onInit() {
    _curretUser();
    super.onInit();
  }

  singInOut() {
    //_googleSignIn.disconnect();

    LocalStorageUtils.setStringKey(Globals.CURRENT_USER_KEY, '');
    Get.toNamed(AuthRouting.LOGIN_ROUTE);
  }

  _curretUser() async {
    var existingUser = await _repo.checkUser();
    if (existingUser != null) {
      user.value = existingUser;
    } else {
      Get.toNamed(AuthRouting.LOGIN_ROUTE);
    }
  }

  consumeTap(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text(
                    'Sucursal Colonia del Valle',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Calle Colonia del Valle #123',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.48,
                    child: const MapFlutter(),
                  ),
                ],
              ),
            ));
  }
}
