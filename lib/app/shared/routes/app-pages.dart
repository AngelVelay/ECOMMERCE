// ignore_for_file: file_names
import 'package:jexpoints/app/modules/auth/auth.module.dart';
import 'package:jexpoints/app/modules/cart/cart.module.dart';
import 'package:jexpoints/app/modules/home/home.module.dart';
import 'package:jexpoints/app/modules/main/main.module.dart';
import 'package:jexpoints/app/modules/rewards/rewards.module.dart';
import 'package:jexpoints/app/modules/store/store.module.dart';
import 'package:jexpoints/app/modules/ubications/ubications.module.dart';

abstract class AppPages {
  static final routes = [
    ...AuthRouting.routes,
    ...MainRouting.routes,
    ...CartRouting.routes,
    ...HomeRouting.routes,
    ...RewardsRouting.routes,
    ...StoreRouting.routes,
    ...UbicationsRouting.routes,
  ];
}
