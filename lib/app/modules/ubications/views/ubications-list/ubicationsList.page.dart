import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jexpoints/app/modules/ubications/views/ubications/ubications-branches/ubications-branches.controller.dart';

import '../../entities/sucursal-type.dart';
import 'ubicationsList.controller.dart';

class UbicationsListPage extends GetView<UbicationsListController> {
  final controllerUbi = Get.find<UbicationsBranchesController>();
  UbicationsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2222222),
        title: const Text('Ubicaciones'),
      ),
      body: Column(children: [
        Expanded(child: Obx(() {
          if (controllerUbi.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return _branchesListWidget(context);
          }
        })),
      ]),
    );
  }

  _branchesListWidget(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
          child: Column(children: <Widget>[
        controllerUbi.branchesToShow.isNotEmpty
            ? Column(children: [
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controllerUbi.branchesToShow.length,
                    itemBuilder: (context, i) {
                      return _branchesItemWidget(
                          context, controllerUbi.branchesToShow[i]);
                    })
              ])
            : Container(
                child: const Text('No hay tiendas que mostrar'),
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(color: Colors.grey[300]),
              ),
      ]));
    });
  }

  _branchesItemWidget(BuildContext context, SucursalType item) {
    return ListTile(
      title: Text(item.name.toString()),
      subtitle: Text(item.description.toString(),
          style: const TextStyle(color: Colors.grey)),
      onTap: () {
        controllerUbi.consumeTap(context, item);
      },
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
