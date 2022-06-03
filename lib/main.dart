// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jexpoints/app/modules/auth/services/auth/auth.fake.service.dart';
// import 'app/modules/home/home.module.dart';
// import 'app/modules/home/views/home/home.page.dart';
// import 'app/modules/main/main.module.dart';
// import 'app/shared/routes/app-pages.dart';
// import 'app/modules/auth/auth.module.dart';
// import 'app/modules/auth/views/login/login.page.dart';
// import 'app/shared/theme/app_theme.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       theme: appTheme,
//       debugShowCheckedModeBanner: false,
//       initialRoute: MainRouting.HOME_ROUTE,
//       defaultTransition: Transition.cupertino,
//       initialBinding: HomeBinding(),
//       getPages: AppPages.routes,
//       home: HomePage(),
//       supportedLocales: const [
//         Locale('es'),
//       ],
//       localizationsDelegates: const [
//         ...GlobalMaterialLocalizations.delegates,
//         GlobalWidgetsLocalizations.delegate,
//         FormBuilderLocalizations.delegate,
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.fake.service.dart';
import 'package:jexpoints/app/modules/auth/views/splash/splash-screen.dart';
import 'app/shared/routes/app-pages.dart';
import 'app/modules/auth/auth.module.dart';
import 'app/modules/auth/views/login/login.page.dart';
import 'app/shared/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AuthRouting.SPLASH_ROUTE,
      defaultTransition: Transition.cupertino,
      initialBinding: AuthBinding(),
      getPages: AppPages.routes,
      home: const SplashPage(),
      supportedLocales: const [
        Locale('es'),
      ],
      localizationsDelegates: const [
        ...GlobalMaterialLocalizations.delegates,
        GlobalWidgetsLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
    );
  }
}
