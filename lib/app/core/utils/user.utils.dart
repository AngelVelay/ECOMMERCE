import 'dart:convert';
import 'package:jexpoints/app/core/utils/storage.utils.dart';
import 'package:jexpoints/app/shared/values/globals.dart';

import '../../modules/auth/entities/user.type.dart';

class UserUtils {
  static Future<User?> getCurrentUser() async {
    var userJson =
        await LocalStorageUtils.getStringByKey(Globals.CURRENT_USER_KEY);
    if (userJson.isEmpty)
      return null;
    else
      return User.fromJson(json.decode(userJson));
  }
}
