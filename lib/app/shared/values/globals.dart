// ignore_for_file: constant_identifier_names

import 'package:intl/intl.dart';

class Globals {
  static const String APP_NAME = 'Lealtad';
  static const String TOKEN_KEY = 'token';
  static const String CURRENT_USER_KEY = 'current_user';
  static NumberFormat CURRENCY_FORMATTER =
      NumberFormat.currency(locale: 'en_US', symbol: '\$');
  static NumberFormat NODECIMALS_FORMATTER = NumberFormat();
}
