import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/home/entities/address.type.dart';
import 'package:jexpoints/app/modules/home/views/address/address.controller.dart';
import 'package:jexpoints/app/modules/rewards/entities/payment-methods.type.dart';

import '../../../../shared/values/globals.dart';
import '../../../main/entities/address.type.dart';
import '../../../main/entities/order.type.dart';
import '../payment-methods/payment-methods.controller.dart';
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
              _title('Compras', Icons.shopping_basket_sharp),
              _consumeList(context),
            ],
          ),
          // body: PageView(
          //   scrollDirection: Axis.horizontal,
          //   physics: const BouncingScrollPhysics(),
          //   children: [
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: [
          //         _header(),
          //         _title('Compras', Icons.shopping_basket_sharp),
          //         _consumeList(context),
          //       ],
          //     ),
          //     Column(
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 20.0),
          //           child: _header(),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 20.0),
          //           child: _title('Metodos de Pago', Icons.credit_card),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 20.0),
          //           child: _listPayment(context),
          //         ),
          //       ],
          //     ),
          //     Column(
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 20.0),
          //           child: _header(),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 20.0),
          //           child: _title('Direcciónes', Icons.house),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 20.0),
          //           child: _listAddress(context),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
        ));
  }

  // Widget _pageBody(context) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //     children: [
  //       _header(),
  //       // _title(),
  //       SingleChildScrollView(
  //           child: Expanded(
  //               child: PageView(
  //         scrollDirection: Axis.horizontal,
  //         physics: const BouncingScrollPhysics(),
  //         children: [
  //           _consumeList(context),
  //           _listPayment(context),
  //         ],
  //       ))),
  //     ],
  //   );
  // }

  // Widget _scrollIndicator() {
  //   return Icon(
  //     Icons.keyboard_arrow_down,
  //     color: Colors.white,
  //     size: 20,
  //   );
  // }

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

  Widget _title(title, icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 20),
        const SizedBox(height: 10),
        Text(title,
            style: const TextStyle(
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

Widget _listPayment(BuildContext context) {
  final paymentController = Get.find<PaymentMethodsController>();

  return SingleChildScrollView(child: Obx(() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: paymentController.paymentMethods$.length,
      itemBuilder: (context, index) {
        return _listPaymentItem(context,
            paymentController.paymentMethods$[index], PaymentMethodsController);
      },
    );
  }));
}

Widget _listPaymentItem(BuildContext context, PaymentMethods item, controller) {
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
                  item.fullName.toUpperCase(),
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
          ])));
}

Widget _listAddress(BuildContext context) {
  final addressController = Get.find<AddressController>();

  return SingleChildScrollView(child: Obx(() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: addressController.addressList$.length,
      itemBuilder: (context, index) {
        return _listAddressItem(
            context, addressController.addressList$[index], addressController);
      },
    );
  }));
}

Widget _listAddressItem(BuildContext context, UserAddress item, controller) {
  return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
      child: ListTile(
          leading: item.alias == 'Casa'
              ? const Icon(Icons.house, color: Colors.white)
              : const Icon(Icons.work, color: Colors.white),
          title: Row(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Text(
                    item.street,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'No. ${item.outsideNumber}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    ', Int. ${item.insidelNumber}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ]),
                Row(children: [
                  Text(
                    item.suburb,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    ', ${item.town}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ]),
                Row(children: [
                  Text(
                    item.state,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    ', C.P. ${item.zipcode}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ]),
              ]),
            ],
          ),
          trailing:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            GestureDetector(
              onTap: () => controller.toAddessDetail(item),
              child: const Icon(Icons.edit, color: Colors.grey),
            ),
          ])));
}
