import 'package:get/get.dart';
import 'package:jexpoints/app/modules/register/views/code-branch/code-branch.page.dart';

import 'views/code-branch/code-brach.controller.dart';
import 'views/file-manager/file-manager.controller.dart';
import 'views/file-manager/file-manager.page.dart';
import 'views/have-code/have-code.controller.dart';
import 'views/have-code/have-code.page.dart';

class ProfileRouting {
  static const String HOME_ROUTE = '/home';
  static const String CODE_BRANCH = '/code-branch';
  static const String FILE_MANAGER_PROFILE = '/file-manager-profile';
  static const String ORDER_PROBLEMS_ROUTE = '/order-detail-edit';

  static final routes = [
    GetPage(
      name: CODE_BRANCH,
      page: () => CodeBranchPage(),
    ),
    GetPage(
      name: FILE_MANAGER_PROFILE,
      page: () => FileManagerPage(),
    ),
    GetPage(
      name: ORDER_PROBLEMS_ROUTE,
      page: () => HaveCodePage(),
    )
  ];
}

class CodeBranchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeBranchController>(() => CodeBranchController());
  }
}

class FileManagerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FileManagerController>(() => FileManagerController());
  }
}

class HaveCodeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HaveCodeController>(() => HaveCodeController());
  }
}
