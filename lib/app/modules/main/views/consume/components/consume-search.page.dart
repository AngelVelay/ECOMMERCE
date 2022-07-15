import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/entities/order.type.dart';
import 'package:jexpoints/app/modules/main/views/consume/consume.controller.dart';

class ConsumeSerarch extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        appBarTheme: const AppBarTheme(
            toolbarHeight: 70, backgroundColor: Color(0XFF222222)),
        primaryColor: Colors.black,
        inputDecorationTheme: InputDecorationTheme(
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 10), // change height

            filled: true,
            fillColor: const Color(0xFFFFFFFF),
            hintStyle: const TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            border: InputBorder.none),
        textTheme: Theme.of(context).textTheme.copyWith(
              headline6: const TextStyle(color: Colors.black),
            ));
  }

  @override
  String get searchFieldLabel => 'Buscar alguna compra';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
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
          ? consumeInfo(snapshot.data as List<Order>)
          : const Center(
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
            color: Colors.grey,
            size: 130,
          ),
        ),
      );
    }
    return Container();
  }

  Widget consumeInfo(List<Order> data) {
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
                controller.showDetail(
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

 

