import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../main/entities/credit-card.dart';
import 'payment-methods.controller.dart';

class PaymentMethodsPage extends GetView<PaymentMethodsController> {
  const PaymentMethodsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xff2222222),
        child: SafeArea(
          top: false,
          bottom: true,
          child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => controller.toAdd(),
                )
              ],
            ),
            body: _body(context),
          ),
        ));
  }

  Widget _body(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: _header(),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: _title(),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: _list(context),
      ),
    ]);
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
        Icon(Icons.credit_card, color: Colors.white, size: 20),
        SizedBox(height: 10),
        Text('Metodos de Pago',
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 0,
              color: Colors.white,
            )),
      ],
    );
  }

  Widget _list(BuildContext context) {
    return SingleChildScrollView(child: Obx(() {
      return ListView.builder(
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
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
        child: ListTile(
            leading: const Icon(Icons.credit_card, color: Colors.white),
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
            trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () => controller.toDetail(item),
                    child: const Icon(Icons.edit, color: Colors.grey),
                  ),
                  const Spacer(),
                ])));
  }
}


  // Widget _listItem(BuildContext context, Address item) {
  //   return ListTile(
  //       title: Row(
  //         children: [
  //           Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //             Text(
  //               item.alias.toUpperCase(),
  //               overflow: TextOverflow.ellipsis,
  //               style: Theme.of(context).textTheme.headline4,
  //             ),
  //             Row(children: [
  //               Text(
  //                 item.contactName,
  //                 overflow: TextOverflow.ellipsis,
  //                 style: Theme.of(context).textTheme.bodyText1,
  //               ),
  //               Text(
  //                 ' - ${item.contactPhone}',
  //                 overflow: TextOverflow.ellipsis,
  //                 style: Theme.of(context).textTheme.bodyText1,
  //               ),
  //             ]),
  //             Row(children: [
  //               Text(
  //                 item.street,
  //                 style: Theme.of(context).textTheme.bodyText1,
  //               ),
  //               Text(
  //                 'No. ${item.outsideNumber}',
  //                 style: Theme.of(context).textTheme.bodyText1,
  //               ),
  //               Text(
  //                 ', Int. ${item.insideNumber}',
  //                 style: Theme.of(context).textTheme.bodyText1,
  //               ),
  //             ]),
  //             Row(children: [
  //               Text(
  //                 item.suburb,
  //                 style: Theme.of(context).textTheme.bodyText1,
  //               ),
  //               Text(
  //                 ', ${item.town}',
  //                 style: Theme.of(context).textTheme.bodyText1,
  //               ),
  //             ]),
  //             Row(children: [
  //               Text(
  //                 item.state,
  //                 style: Theme.of(context).textTheme.bodyText1,
  //               ),
  //               Text(
  //                 ', C.P. ${item.zipCode}',
  //                 style: Theme.of(context).textTheme.bodyText1,
  //               ),
  //             ]),
  //           ]),
  //         ],
  //       ),
  //       trailing:
  //           Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
  //         const Spacer(),
  //         const SizedBox(
  //           height: 10,
  //         ),
  //         GestureDetector(
  //           onTap: () => controller.toAddessDetail(item),
  //           child: const Icon(Icons.edit, color: Colors.grey),
  //         ),
  //         const Spacer(),
  //       ]));
  // }
