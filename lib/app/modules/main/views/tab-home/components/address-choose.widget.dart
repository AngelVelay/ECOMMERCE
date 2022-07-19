import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/core/utils/sheet.utils.dart';

import '../../../../../components/form-controls/custom-rounded-button.widget.dart';
import '../../../entities/address.type.dart';
import '../../map-add-address/map-add-address.page.dart';
import '../tab-home.controller.dart';
import 'address-add.widget.dart';

class HomeAddressSelect extends GetView<HomeController> {
  @override
  final HomeController controller;

  const HomeAddressSelect(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_list(context), _button(context)],
      ),
    );
  }

  Widget _list(BuildContext context) {
    return Column(
      children: controller.addressList$.map((a) {
        return _listItem(a, context);
      }).toList(),
    );
  }

  Widget _listItem(Address item, BuildContext context) {
    return Row(children: [
      Radio<Address>(
        value: item,
        groupValue: controller.selectedAddress$.value,
        onChanged: (value) {
          controller.addressSelect(value as Address, context);
          Navigator.of(context, rootNavigator: true).pop();
        },
      ),
      const SizedBox(width: 10),
      Text('${item.street} No.${item.outsideNumber}, CP. ${item.zipCode}'),
    ]);
  }

  Widget _button(BuildContext context) {
    return Container(
        height: 60,
        child: CustomRoundedButton(
          text: 'Agrega una nueva dirección',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AddAdressPage();
            }));
          },
        ));
  }
}
