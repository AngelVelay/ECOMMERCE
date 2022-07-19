import 'dart:io';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
class MapUtils {
  MapUtils._();

  static Future<void> openMap(double lat, double lng) async {
    if (Platform.isAndroid) {
      Uri url = Uri.parse('geo:${lat},${lng}?q=${lat},${lng}');
      // ignore: deprecated_member_use
      if (await canLaunch(url.toString())) {
        // ignore: deprecated_member_use
        await launch(url.toString());
      } else {
        await LaunchApp.openApp(
          androidPackageName: 'com.google.android.gms.maps',
          // iosUrlScheme: 'maps://',
          openStore: true,
        );
      }
    } else if (Platform.isIOS) {
      Uri url = Uri.parse('maps:${lat},${lng}?q=${lat},${lng}');
      // ignore: deprecated_member_use
      if (await canLaunch(url.toString())) {
        // ignore: deprecated_member_use
        await launch(url.toString());
      } else {
        await LaunchApp.openApp(
          // androidPackageName: 'com.google.android.gms.maps',
          iosUrlScheme: 'maps://',
          openStore: true,
        );
      }
    }
  }
}