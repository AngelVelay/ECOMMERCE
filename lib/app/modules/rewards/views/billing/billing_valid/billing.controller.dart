import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/auth/entities/branch.type.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.contract.dart';
import 'package:jexpoints/app/modules/main/main.module.dart';

import '../../../../main/services/branch/branch.contract.dart';

class BillingController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  late IAuthService _authService;
  final IBranchService _repo;
  var branchList = <Branch>[].obs;
  var isLoading = false.obs;
  var selectedId = ''.obs;

  late var monto = TextEditingController();
  late var ticket = TextEditingController();

  RxString monto$ = ''.obs;
  RxString ticket$ = ''.obs;

  BillingController(IAuthService authService, this._repo) {
    _authService = authService;
  }
  Branch? currentBranch = Branch(
      id: 0,
      externalCode: "externalCode",
      externalId: 0,
      name: "name",
      isActive: true,
      isBySystem: false,
      description: "description");

  @override
  void onInit() {
    super.onInit();
    getBranch();

    monto.text = monto$.value;
    ticket.text = ticket$.value;
  }

  goToHaveCode() {
    //Get.toNamed(RegisterRouting.HAVE_CODE);
  }

  send() {
    Get.toNamed(MainRouting.BILLING_APPLY_ROUTE);
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
}
