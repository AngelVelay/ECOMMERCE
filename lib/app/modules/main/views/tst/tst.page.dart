import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/form-controls/custom-button.widget.dart';

import 'tst.controller.dart';

class TstPage extends GetView<TstController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Row(children: [
        const Spacer(),
        TextButton(
            onPressed: () => {controller.getEmployees()},
            child: const Text('Recargar')),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).buttonColor,
                onPrimary: Theme.of(context).accentColor),
            child: const Text("Mostrar algo"),
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                      color: Colors.white,
                      child: Center(
                          child: CustomButton(
                              text: 'Cerrar',
                              onPressed: () => Navigator.pop(context))));
                },
              );
            }).paddingAll(11)
      ]),
      Expanded(child: Obx(() {
        if (controller.isLoading.value) {
          return Center(
              child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ));
        } else {
          return ListView(
              children: controller.employeeList
                  .map((e) => GestureDetector(
                        child: Row(children: [
                          Text(e.numeroEmpleado).paddingOnly(right: 16),
                          Text(
                              '${e.nombre} ${e.apellidoPaterno} ${e.apellidoMaterno}')
                        ]),
                        onTap: () => controller.selectEmployee(e),
                      ).paddingAll(16))
                  .toList());
        }
      }))
    ]));
  }
}
