// ignore_for_file: file_names
import 'package:jexpoints/app/modules/auth/auth.module.dart';
import 'package:jexpoints/app/modules/main/main.module.dart';

abstract class AppPages {
  static final routes = [
    ...AuthRouting.routes,
    ...MainRouting.routes,
  ];
}
