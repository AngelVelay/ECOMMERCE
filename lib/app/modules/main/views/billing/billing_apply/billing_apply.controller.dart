import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/auth/entities/branch.type.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.contract.dart';
import 'package:jexpoints/app/modules/main/services/branch/branch.contract.dart';

import '../../../main.module.dart';

class BillingApplyController extends GetxController {
  final IBranchService _repo;
  final formKey = GlobalKey<FormBuilderState>();
  late IAuthService _authService;
  var branchList = <Branch>[].obs;
  var isLoading = false.obs;
  var selectedId = ''.obs;

  Branch? currentBranch = Branch(
      id: 0,
      externalCode: "externalCode",
      externalId: 0,
      name: "name",
      isActive: true,
      isBySystem: false,
      description: "description");

  BillingApplyController(this._repo);

  @override
  void onInit() {
    super.onInit();
    getBranch();
  }

  void getBranch() async {
    try {
      isLoading.value = true;
      var branch = await _repo.getAll();

      if (branch.isEmpty == false) {
        branchList.value = branch;
      }
    } finally {
      isLoading.value = false;
    }
  }

  goToHaveCode() {
    //Get.toNamed(RegisterRouting.HAVE_CODE);
  }

  send() {
    Get.toNamed(MainRouting.BILLING_APPLY_ROUTE);
  }
}
