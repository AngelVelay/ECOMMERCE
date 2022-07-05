import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/entities/credit-card.dart';
import 'payment-methods.controller.dart';

class PaymentMethodsPage extends GetView<PaymentMethodsController> {
  const PaymentMethodsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mis Metodo de Pago'),
          actions: [
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => controller.toAdd())
          ],
        ),
        body: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Column(children: [
      _list(context),
    ]);
  }

  Widget _list(BuildContext context) {
    return SingleChildScrollView(child: Obx(() {
      return ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: controller.paymentMethods$.length,
        itemBuilder: (context, index) {
          return _listItem(context, controller.paymentMethods$[index]);
        },
      );
    }));
  }

  Widget _listItem(BuildContext context, CreditCard item) {
    return ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                item.cardNumber.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                item.cardHolder.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ]),
          ],
        ),
        trailing:
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Spacer(),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () => controller.toDetail(item),
            child: const Icon(Icons.edit, color: Colors.grey),
          ),
          const Spacer(),
        ]));
  }
}
