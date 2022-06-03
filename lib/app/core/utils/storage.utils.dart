import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageUtils {
  // Singleton
  // SharedUtils._privateConstructor();
  // static final SharedUtils _instance = SharedUtils._privateConstructor();
  // static SharedUtils get instance => _instance;
  // End Singleton

  // late SharedPreferences preferences;

  // SharedUtils() {
  //   _getPreferencesInstance();
  // }

  // _getPreferencesInstance() async {
  //   preferences = await SharedPreferences.getInstance();
  // }

  static Future<String> getStringByKey(String key) async {
    // var prefs = SharedUtils.instance;
    var prefs = await SharedPreferences.getInstance();
    var result = prefs.getString(key);
    return result ?? '';
  }

  static void setStringKey(String key, String value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  // static Future<dynamic> getByKey<T>(String key) async {
  //   var prefs = await SharedPreferences.getInstance();
  //   var result = prefs.getString(key);
  //   return result;
  // }

  // static void setKey<T>(String key, T value) async {
  //   var prefs = await SharedPreferences.getInstance();
  //   prefs.setString(key, value.toString());
  // }
}
