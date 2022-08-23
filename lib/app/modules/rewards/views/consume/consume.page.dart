import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jexpoints/app/shared/values/globals.dart';
import '../../../main/entities/order.type.dart';
import 'components/consume-search.page.dart';
import 'consume.controller.dart';

class ConsumePage extends GetView<ConsumeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () =>
                  showSearch(context: context, delegate: ConsumeSerarch()),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _header(),
            _title(),
            SingleChildScrollView(
                child: Expanded(child: _consumeList(context))),
          ],
        ),
      ),
    );
  }

  Widget _scrollIndicator() {
    return Icon(
      Icons.keyboard_arrow_down,
      color: Colors.white,
      size: 20,
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 33, // Image radius
          backgroundImage:
              AssetImage('assets/images/female-07.jpg'), // Image URL
        ),
        const SizedBox(width: 20),
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _name(),
              const SizedBox(height: 10),
              _pointsIndicator(),
              const SizedBox(height: 15),
            ])
      ],
    );
  }

  Widget _name() {
    return const Text('Angel Velay Lopez',
        style: TextStyle(
            fontSize: 20,
            letterSpacing: 0,
            color: Colors.white,
            fontFamily: 'Montserrat-Bold'));
  }

  Widget _pointsIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(
          width: 10,
          height: 10,
          child: FadeInImage(
              placeholder: AssetImage('assets/images/shine.png'),
              image: AssetImage('assets/images/shine.png')),
        ),
        SizedBox(width: 5),
        Text('56 pts', style: TextStyle(fontSize: 10, color: Colors.white)),
        // Text(
        //     '  (${NumberFormat.currency(locale: "en_US", symbol: '\$ ').format(controller.user$.value.membership?.pointsValue)})',
        //     style: const TextStyle(fontSize: 13, color: Colors.white)
        // )
      ],
    );
  }

  Widget _title() {
    return Column(
      children: const [
        Icon(Icons.shopping_basket, color: Colors.white, size: 15),
        SizedBox(height: 10),
        Text('Compras',
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 0,
              color: Colors.white,
            )),
      ],
    );
  }

  Widget _consumeList(BuildContext context) {
    return SingleChildScrollView(child: Obx(() {
      return ListView.builder(
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
      child: ListTile(
        leading: item.deliveryType == DeliveryType.envioADomicilio
            ? const Icon(Icons.delivery_dining_rounded, color: Colors.grey)
            : const Icon(Icons.store, color: Colors.grey),
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Column(
            children: [
              Text(
                item.date,
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
              const Text(
                '',
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  item.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
              Text(
                item.orderStatusName,
                style: item.orderStatusId == OrderStatusEnum.canceled
                    ? const TextStyle(color: Colors.red, fontSize: 10)
                    : item.orderStatusId == OrderStatusEnum.delivered
                        ? const TextStyle(color: Colors.green, fontSize: 10)
                        : const TextStyle(
                            color: Colors.amberAccent, fontSize: 10),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(Globals.CURRENCY_FORMATTER.format(item.total),
                  style: TextStyle(fontSize: 10, color: Colors.white)),
              Text(
                '${Globals.NODECIMALS_FORMATTER.format(item.points)} pts',
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
