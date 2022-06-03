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
  // static final _googleSignIn = GoogleSignIn(
  //   //clientId: Enviroments.GOOGLE_CLIENT_ID,
  //   signInOption: SignInOption.standard,
  //   scopes: [
  //     'email',
  //     'profile',
  //   ],
  // );

  final List<Map<String, String>> compras = [
    {
      'id': '1',
      'name': 'Sucursal Colonia del Valle',
      'address': 'Calle Colonia del Valle #123',
      'compra': 'Pastel',
      'costo': '154',
      'puntos': '30',
      'fecha': '20/10/2020'
    },
    {
      'id': '2',
      'name': 'Sucursal Calz Ignacio Zaragoza',
      'address': 'Calz Ignacio Zaragoza #89',
      'compra': 'Pan',
      'costo': '56',
      'puntos': '38',
      'fecha': '25/05/2020'
    },
    {
      'id': '3',
      'name': 'Pastelerías Romero Rubio',
      'address': 'Romero Rubio #89',
      'compra': 'Dona',
      'costo': '45',
      'puntos': '12',
      'fecha': '2/01/2022'
    },
    {
      'id': '4',
      'name': 'Pastelería Esperanza (Bolivar)',
      'address': 'Bolivar #49',
      'compra': 'Pan de Chocolate',
      'costo': '18',
      'puntos': '6',
      'fecha': '23/01/2022'
    },
    // {
    //   'id': '5',
    //   'name': 'ESPERANZA (CHAPULTEPEC)',
    //   'address': 'CHAPULTEPEC #12',
    //   'compra': 'Paastel de Fresa',
    //   'costo': '108',
    //   'puntos': '23',
    //   'fecha': '23/01/2021'
    // },
    // {
    //   'id': '6',
    //   'name': 'Pastelerías Esperanza (H.Churubusco)',
    //   'address': 'Héroes de Churubusco #32',
    //   'compra': 'Pan de Chocolate',
    //   'costo': '188',
    //   'puntos': '78',
    //   'fecha': '23/01/2021'
    // },
  ];


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

  consumeTap(BuildContext context){
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
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Calle Colonia del Valle #123',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context)
                          .size
                          .height *
                      0.48,
                  child: const MapFlutter(),
                ),
              ],
            ),
          ));
  }
}
