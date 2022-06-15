import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../components/circular-progress-bar/circular-progress-bar.dart';
import '../../../../components/map_ubication/map_ubication.dart';
import '../../entities/my-shopping.type.dart';
import '../profile/profile.page.dart';
import 'components/timeline.dart';
import 'consume.controller.dart';

class ConsumePage extends GetView<ConsumeController> {
  const ConsumePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff2222222),
      child: SafeArea(
        left: false,
        right: false,
        child: Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: CustomSliverDelegate(
                  expandedHeight: 80,
                ),
              ),
              SliverFillRemaining(
                  child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(height: 20),
                  // ConsumeInfo(),
                  consumeInfo(),
                ]),
              )),
            ],
          ),
        ),
      ),
    );
  }

//   static Widget _consumeInfo(
//       BuildContext context, ConsumeController controller) {
//     return Column(children: [
//       // List Header
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: const [
//           Text(' Mis Consumos', style: TextStyle(fontSize: 22)),
//         ],
//       ).paddingSymmetric(horizontal: 10),
//       const Divider(thickness: 2),
//       _consumeList(context, controller)
//     ]);
//   }
// }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;

  CustomSliverDelegate({
    required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: AppBar(
                backgroundColor: Color(0xFF222222),
                elevation: 0.0,
                title: Opacity(
                  opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                  child: Text(" Mis Consumos",
                      style: TextStyle(color: Colors.white)),
                )),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: Opacity(
              opacity: percent,
              child: Form(
                child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFfffffff),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: MediaQuery.of(context).size.width - 50,
                    child: TextField(
                      cursorColor: Colors.black,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          hintText: 'Buscar',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          suffixIcon:
                              Icon(Icons.food_bank, color: Colors.black)),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class consumeInfo extends GetView<ConsumeController> {
  const consumeInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // List Header
      _consumeList(context, controller),
    ]);
  }

  // List
  static Widget _consumeList(
      BuildContext context, ConsumeController controller) {
    return SingleChildScrollView(child: Obx(() {
      return ListView.separated(
        separatorBuilder: (context, index) => const Divider(thickness: 2),
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
              child:
                  _consumeListItem(context, controller.shoppingList$[index]));
        },
      );
    }));
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
