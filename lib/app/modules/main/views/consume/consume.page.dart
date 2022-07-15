import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/views/consume/components/consume-search.page.dart';
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
              width: MediaQuery.of(context).size.width - 145,
              child: Text(
                item.name,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Row(
              children: [
                Text(
                  item.fecha,
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
      leading: item.deliveryType == DeliveryType.envioADomicilio
          ? const Icon(Icons.delivery_dining_rounded, color: Colors.grey)
          : const Icon(Icons.store, color: Colors.grey),
    );
  }
}
