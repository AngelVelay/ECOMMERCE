import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jexpoints/app/components/dashed-line/dashed-line.dart';
import 'package:jexpoints/app/modules/main/entities/order.type.dart';
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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(),
        const DividerDash(color: Colors.grey),
        _deliverySummary(),
        const DividerDash(color: Colors.grey),
        _details(),
        _totals(),
        const Tracker()
      ],
    );
  }

  Widget _title() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          const Text(
            'Envío a domicilio',
            style: TextStyle(fontSize: 14),
          ),
          const Spacer(),
          Text(
            controller.order$.value.orderStatusName,
            style: TextStyle(
                fontSize: 14,
                color: controller.order$.value.orderStatusId ==
                        OrderStatusEnum.canceled
                    ? Colors.red
                    : controller.order$.value.orderStatusId ==
                            OrderStatusEnum.delivered
                        ? Colors.green
                        : Colors.amber[800]),
          ),
        ]),
        Row(
          children: [
            Text(
              controller.order$.value.date,
              style: const TextStyle(fontSize: 12),
            ),
            const Spacer(),
          ],
        )
      ],
    ).paddingOnly(bottom: 10);
  }

  Widget _deliverySummary() {
    return Column(children: [
      Row(children: [
        const Icon(
          Icons.location_on,
          color: Colors.black,
          size: 30,
        ),
        const SizedBox(width: 10),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Enviado a:',
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
          Text(
            '${controller.order$.value.deliveredAddress!.street} ${controller.order$.value.deliveredAddress!.outsideNumber}',
            style: const TextStyle(fontWeight: FontWeight.w300),
          )
        ]),
        const Spacer(),
      ]),
      const SizedBox(
        height: 10,
      ),
      Row(
        children: [
          const Icon(Icons.credit_card, color: Colors.black, size: 30),
          const SizedBox(width: 10),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Forma de Pago:',
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
            Text(controller.order$.value.paymentMethod!.cardNumber)
          ]),
          const Spacer(),
        ],
      ),
    ]).paddingSymmetric(vertical: 10);
  }

  Widget _details() {
    return Container();
  }

  Widget _totals() {
    return Column(
      children: [
        _totalRow('Subtotal', controller.order$.value.subtotal),
        controller.order$.value.discount != null
            ? _totalRow('Descuento', controller.order$.value.discount!)
            : Container(),
        _totalRow('Envío', controller.order$.value.deliveryAmount),
        _totalRow('Total', controller.order$.value.total)
      ],
    );
  }

  Widget _totalRow(String label, double value) {
    return Row(children: [
      Text(
        label,
        style: const TextStyle(fontSize: 15, color: Colors.black),
      ),
      const Spacer(),
      Text(
        NumberFormat.currency(locale: 'en_US', symbol: '\$ ').format(value),
        style: const TextStyle(fontSize: 15, color: Colors.black),
      ),
    ]).paddingSymmetric(vertical: 5);
  }
}
