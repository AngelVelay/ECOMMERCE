import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jexpoints/app/modules/main/services/shopping/shopping.fake.service.dart';
import 'package:jexpoints/app/modules/main/views/consume/consume.controller.dart';

import '../../../entities/my-shopping.type.dart';

class ConsumeSerarch extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: Theme.of(context).textTheme.headline4,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        textTheme: Theme.of(context).textTheme.copyWith(
              headline6: TextStyle(color: Colors.white),
            ));
  }

  @override
  String get searchFieldLabel => 'Buscar alguna compra';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final controller = Get.find<ConsumeController>();

    return FutureBuilder(
      future: controller.getByName(query),
      builder: (_, snapshot) => snapshot.hasData
          ? consumeInfo(snapshot.data as List<MyShopping>)
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(
        child: const Center(
          child: Icon(
            Icons.search_off_rounded,
            color: Colors.black,
            size: 130,
          ),
        ),
      );
    }
    return Container();
  }

  Widget consumeInfo(List<MyShopping> data) {
    // return ListView.builder(
    //     itemCount: data.length,
    //     itemBuilder: (context, index) {
    //       return ListTile(
    //         title: Text(data[index].name),
    //         subtitle: Text(data[index].fecha),
    //         trailing: Text('\$ ${data[index].costo}.00'),
    //       );
    //     });
    final controller = Get.find<ConsumeController>();

    return SingleChildScrollView(
      child: ListView.separated(
        separatorBuilder: (context, index) => const Divider(thickness: 2),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                controller.selectedDeliveryType(
                    controller.shoppingList$.value[index], context);
              },
              child: _consumeListItem(context, data[index]));
        },
      ),
    );
  }

  static Widget _consumeListItem(BuildContext context, dynamic item) {
    return ListTile(
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(10)),
      // color: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 145,
              child: Text('${item.name}', overflow: TextOverflow.ellipsis),
            ),
            Text('${item.fecha}'),
          ]),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text('\$${item.costo}.00'),
            Text(
              '${item.puntos} pts',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ]),
        ],
      ),
      trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 20),
    );
  }
}

// class consumeInfo extends GetView<ConsumeController> {
//   const consumeInfo({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       // List Header
//       _consumeList(context, controller),
//     ]);
//   }

//   // List
//   static Widget _consumeList(
//       BuildContext context, ConsumeController controller) {
//     return SingleChildScrollView(child: Obx(() {
//       return ListView.separated(
//         separatorBuilder: (context, index) => const Divider(thickness: 2),
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         scrollDirection: Axis.vertical,
//         itemCount: controller.shoppingList$.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//               onTap: () {
//                 controller.selectedDeliveryType(
//                     controller.shoppingList$.value[index], context);
//               },
//               child:
//                   _consumeListItem(context, controller.shoppingList$[index]));
//         },
//       );
//     }));
//   }

 

