import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jexpoints/app/modules/main/views/consume/order-detail.controller.dart';
import 'tracker.dart';

class OrderDetailDelivery extends GetView<OrderDetailController> {
  const OrderDetailDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return _content(context);
    }));
  }

  Widget _content(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _title(),
        _deliverySummary(),
        const Divider(thickness: 2),
        _totals(),
        const Tracker()
      ],
    );
  }

  Widget _title() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10.0, top: 10, right: 10, bottom: 5),
          child: Text(
            'Envío a Domicilio',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          controller.order$.value.orderStatusName,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _deliverySummary() {
    return Column(children: [
      ListTile(
          trailing: const Icon(
            Icons.location_on,
            color: Colors.black,
            size: 30,
          ),
          title: const Text(
            'Enviado a:',
            style: TextStyle(color: Colors.black),
          ),
          subtitle: controller.order$.value.deliveredAddress != null
              ? Text(controller.order$.value.deliveredAddress!.street)
              : const Text('')),
      ListTile(
        trailing: const Icon(Icons.credit_card, color: Colors.black, size: 30),
        title: const Text(
          'Forma de Pago:',
          style: TextStyle(color: Colors.black),
        ),
        subtitle: controller.order$.value.paymentMethod != null
            ? Text(controller.order$.value.paymentMethod!.cardNumber)
            : const Text(''),
      ),
    ]);
  }

  Widget _totals() {
    return Column(
      children: [
        controller.order$.value.discount == null
            ? Container()
            : ListTile(
                title: const Text(
                  'Cupon de descuento',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
                leading: const Icon(
                  Icons.card_giftcard_rounded,
                  color: Colors.black,
                ),
                trailing: Text(
                  ' - ${controller.order$.value.discount!.toString()}',
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
        ListTile(
          title: const Text(
            'Envío',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          trailing: Text(
            NumberFormat.currency(locale: 'en_US', symbol: '\$ ')
                .format(controller.order$.value.deliveryAmount),
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        ListTile(
          title: const Text(
            'Total',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          trailing: Text(
            NumberFormat.currency(locale: 'en_US', symbol: '\$ ')
                .format(controller.order$.value.total),
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
