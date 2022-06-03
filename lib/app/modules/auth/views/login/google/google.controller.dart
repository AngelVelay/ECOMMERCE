import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:jexpoints/app/shared/values/enviroments.dart';

class GoogleSignController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  static final _googleSignIn =
      GoogleSignIn(clientId: Enviroments.GOOGLE_CLIENT_ID, scopes: ['email']);

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
}

Future signIn() async {
  await GoogleSignController.login();
}
