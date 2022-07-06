import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/views/consume/components/consume-search.page.dart';
import '../../entities/my-shopping.type.dart';
import 'consume.controller.dart';

class ConsumePage extends GetView<ConsumeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      left: false,
      right: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mis Compras'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () =>
                  showSearch(context: context, delegate: ConsumeSerarch()),
            )
          ],
        ),
        body: consumeInfo(),
      ),
    );
  }
}

//           body: CustomScrollView(
//             slivers: <Widget>[
//               SliverPersistentHeader(
//                 pinned: true,
//                 floating: true,
//                 delegate: CustomSliverDelegate(
//                   controller,
//                   expandedHeight: 80,
//                 ),
//               ),
//               SliverFillRemaining(
//                   child: SingleChildScrollView(
//                 child: Column(children: [
//                   SizedBox(height: 20),
//                   // ConsumeInfo(),
//                   consumeInfo(),
//                 ]),
//               )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
//   final double expandedHeight;
//   final bool hideTitleWhenExpanded;
//   final ConsumeController controller;

//   CustomSliverDelegate(
//     this.controller, {
//     required this.expandedHeight,
//     this.hideTitleWhenExpanded = true,
//   });

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     final appBarSize = expandedHeight - shrinkOffset;
//     final cardTopPosition = expandedHeight / 2 - shrinkOffset;
//     final proportion = 2 - (expandedHeight / appBarSize);
//     final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
//     return SizedBox(
//       height: expandedHeight + expandedHeight / 2,
//       child: Stack(
//         children: [
//           SizedBox(
//             height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
//             child: AppBar(
//                 backgroundColor: Color(0xFF222222),
//                 elevation: 0.0,
//                 title: Opacity(
//                   opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
//                   child: Text(" Mis Consumos",
//                       style: TextStyle(color: Colors.white)),
//                 )),
//           ),
//           _searchInput(context, percent, controller),
//         ],
//       ),
//     );
//   }

//   @override
//   double get maxExtent => expandedHeight + expandedHeight / 2;

//   @override
//   double get minExtent => kToolbarHeight;

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }
// }

// Widget _searchInput(
//     BuildContext context, double percent, ConsumeController controller) {
//   return Positioned(
//     right: 20,
//     top: 50,
//     child: Opacity(
//       opacity: percent,
//       child: Form(
//         child: Container(
//             decoration: BoxDecoration(
//               color: Color(0xFFfffffff),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             width: MediaQuery.of(context).size.width - 50,
//             child: TextField(
//               controller: controller.keywordCtrl,
//               onEditingComplete: () => controller.search(context),
//               cursorColor: Colors.black,
//               style: TextStyle(color: Colors.black),
//               decoration: InputDecoration(
//                   hintText: 'Buscar',
//                   floatingLabelBehavior: FloatingLabelBehavior.always,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: BorderSide(
//                       width: 2,
//                       color: Colors.black,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: BorderSide(
//                       width: 2,
//                       color: Colors.black,
//                     ),
//                   ),
//                   prefixIcon: Icon(
//                     Icons.search,
//                     color: Colors.black,
//                   ),
//                   suffixIcon: Icon(Icons.food_bank, color: Colors.black)),
//             )),
//       ),
//     ),
//   );
// }

class consumeInfo extends GetView<ConsumeController> {
  const consumeInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // List Header
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: _consumeList(context, controller),
      ),
    ]);
  }

  // List
  static Widget _consumeList(
      BuildContext context, ConsumeController controller) {
    return SingleChildScrollView(child: Obx(() {
      return ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          thickness: 2,
          color: Colors.white,
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: controller.shoppingList$.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                controller.selectedDeliveryType(
                    controller.shoppingList$.value[index], context);
              },
              child: _consumeListItem(
                  context, controller.shoppingList$[index], controller));
        },
      );
    }));
  }

  static Widget _consumeListItem(
      BuildContext context, dynamic item, ConsumeController controller) {
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
              child: Text(
                '${item.name}',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Text(
              '${item.fecha}',
              style: Theme.of(context).textTheme.headline5,
            ),
          ]),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(
              '\$${item.costo}.00',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              '${item.puntos} pts',
              style: Theme.of(context).textTheme.headline5,
            ),
          ]),
        ],
      ),
      // ignore: unrelated_type_equality_checks
      trailing: item.deliveryType == DeliveryType.envioADomicilio
          ? Icon(Icons.delivery_dining_rounded, color: Colors.grey)
          : Icon(Icons.store, color: Colors.grey),
    );
  }
}
