import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jexpoints/app/modules/main/views/consume/components/consume-search.page.dart';
import 'package:jexpoints/app/shared/values/globals.dart';
import '../../entities/order.type.dart';
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
        body: _consumeList(context),
      ),
    );
  }

  // List
  Widget _consumeList(BuildContext context) {
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
                controller.showDetail(controller.shoppingList$[index], context);
              },
              child:
                  _consumeListItem(context, controller.shoppingList$[index]));
        },
      );
    }));
  }

  Widget _consumeListItem(BuildContext context, Order item) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 155,
              child: Text(
                item.name,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Row(
              children: [
                Text(
                  item.date,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(
                  width: 40,
                ),
                Text(
                  item.orderStatusName,
                  style: item.orderStatusId == OrderStatusEnum.canceled
                      ? const TextStyle(color: Colors.red)
                      : item.orderStatusId == OrderStatusEnum.delivered
                          ? const TextStyle(color: Colors.green)
                          : const TextStyle(color: Colors.amberAccent),
                ),
              ],
            ),
          ]),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(
              Globals.CURRENCY_FORMATTER.format(item.total),
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              '${Globals.NODECIMALS_FORMATTER.format(item.points)} pts',
              style: Theme.of(context).textTheme.headline5,
            ),
          ]),
        ],
      ),
      leading: item.deliveryType == DeliveryType.envioADomicilio
          ? const Icon(Icons.delivery_dining_rounded, color: Colors.grey)
          : const Icon(Icons.store, color: Colors.grey),
    );
  }
}
