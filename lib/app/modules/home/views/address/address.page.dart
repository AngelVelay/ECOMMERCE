import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../main/entities/address.type.dart';
import 'address.controller.dart';

class AddressPage extends GetView<AddressController> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xff2222222),
        child: SafeArea(
          top: false,
          bottom: true,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Mis Domicilios'),
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
        itemCount: controller.addressList$.length,
        itemBuilder: (context, index) {
          return _listItem(context, controller.addressList$[index]);
        },
      );
    }));
  }

  Widget _listItem(BuildContext context, Address item) {
    return ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                item.alias.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline4,
              ),
              Row(children: [
                Text(
                  item.contactName,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  ' - ${item.contactPhone}',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ]),
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
                  ', Int. ${item.insideNumber}',
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
                  ', C.P. ${item.zipCode}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ]),
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
            onTap: () => controller.toAddessDetail(item),
            child: const Icon(Icons.edit, color: Colors.grey),
          ),
          const Spacer(),
        ]));
  }
}
