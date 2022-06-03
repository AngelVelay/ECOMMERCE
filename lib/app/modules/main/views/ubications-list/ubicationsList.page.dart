import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jexpoints/app/modules/main/entities/ubications.type.dart';
import 'package:jexpoints/app/modules/main/views/ubications-list/ubicationsList.controller.dart';

class UbicationsListPage extends GetView<UbicationsListController> {
  const UbicationsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2222222),
        title: const Text('Ubicaciones'),
      ),
      body: Column(children: [
        Expanded(child: Obx(() {
          if (controller.isLoading.value)
            return const Center(child: CircularProgressIndicator());
          else
            return _branchesListWidget(context);
        })),
      ]),
    );
  }

  _branchesListWidget(BuildContext context) {
    return Container(child: Obx(() {
      return SingleChildScrollView(
          child: Column(children: <Widget>[
        controller.reports$.length > 0
            ? Column(children: [
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.reports$.length,
                    itemBuilder: (context, i) {
                      return _branchesItemWidget(
                          context, controller.reports$[i]);
                    })
              ])
            : Container(
                child: const Text('No hay tiendas que mostrar'),
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(color: Colors.grey[300]),
              ),
      ]));
    }));
  }

  _branchesItemWidget(BuildContext context, UbicationsObject item) {
    return ListTile(
      title: Container(
        child: Text(item.name),
      ),
      subtitle:
          Text(item.description, style: const TextStyle(color: Colors.grey)),
      onTap: () {
        controller.consumeTap(context, item);

        // final arguments = (ModalRoute.of(context)?.settings.arguments ??
        //     <String, dynamic>{}) as Map;
        // arguments['ubication'] = item;
        // Navigator.pushNamed(context, '/ubications', arguments: arguments);
      },
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
